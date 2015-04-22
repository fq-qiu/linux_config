CURRENT_PATH=`pwd`
TAG="qiufuqing___"
COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

APPLICATION_ORIGINAL_PATH=`tail -15 .compile_tmp | grep ^Install.*apk | awk '{print $1}'`
ANDROID_VERSION=`tail -15 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $4}'`
APPLICATION=`tail -15 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $7}'`
rm .compile_tmp

for i in "${SYSTEM_APPLICATION[@]}"; do
    if [ $i = $APPLICATION ]
    then
        target_install_path="/system/priv-app"
    else
        target_install_path="/system/app"
    fi
done
echo ${TAG}${target_install_path}

if [ ${ANDROID_VERSION:0} != "5" ]
then
    adb shell rm ${target_install_path}"/"${APPLICATION}"*"
    adb push ${APPLICATION_ORIGINAL_PATH} ${target_install_path}"/"
else
    adb push ${APPLICATION_ORIGINAL_PATH} ${target_install_path}"/"${target_install_path}$"/"
    zygote_id=`adb shell ps | grep -i zygote | awk '{print $2}'`
    adb shell kill -9 $zygote_id
fi

