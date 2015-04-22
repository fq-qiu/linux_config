CURRENT_PATH=`pwd`
TAG="____"
COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

APPLICATION_ORIGINAL_PATH=`tail -50 .compile_tmp | grep ^Install.*apk | awk '{print $2}'`
ANDROID_VERSION=`tail -50 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $4}'`
APPLICATION=`tail -50 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $7}'`
#rm .compile_tmp
echo ${TAG}"sdk_version____:"${ANDROID_VERSION}
echo ${TAG}"application____:"${APPLICATION}

for i in "${SYSTEM_APPLICATION[@]}"; do
    if [ $i = $APPLICATION ]
    then
        target_install_path="system/priv-app"
    else
        target_install_path="system/app"
    fi
done
echo ${TAG}"target_path____:"${target_install_path}

if [ ${ANDROID_VERSION:0:1} = "5" ]
then
    echo "adb push "${APPLICATION_ORIGINAL_PATH}" "${target_install_path}"/"${APPLICATION}"/"
    adb push ${APPLICATION_ORIGINAL_PATH} ${target_install_path}"/"${APPLICATION}"/"
    #sleep 3s
    zygote_id=`adb shell ps | grep -i zygote | awk '{print $2}'`
    adb shell kill -9 $zygote_id
else
    echo "adb push "${APPLICATION_ORIGINAL_PATH}" "${target_install_path}"/"
    adb shell rm ${target_install_path}"/"${APPLICATION}"*"
    adb push ${APPLICATION_ORIGINAL_PATH} ${target_install_path}"/"
fi

