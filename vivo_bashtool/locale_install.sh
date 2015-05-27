CURRENT_PATH=`pwd`
TAG="____"
COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

APPLICATION_ORIGINAL_PATH=`tail -50 .compile_tmp | grep ^Install.*apk | awk '{print $2}'`
ANDROID_VERSION=`tail -50 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $4}'`
APPLICATION=`tail -50 .compile_tmp | grep ^Install.*apk | awk -F/ '{print $7}'`
APPLICATION=${APPLICATION%.*}
#rm .compile_tmp
echo ${TAG}"sdk_version____:"${ANDROID_VERSION}
echo ${TAG}"application____:"${APPLICATION}

PACKAGENAME=${APPLICATION}
TARGET_INSTALL_PATH="system/app"
if [[ ${APPLICATION} = "BBKVideoPlayer" ]]; then
    echo ${APPLICATION}
    PACKAGENAME="VideoPlayer"
elif [[ ${APPLICATION} = "MediaProvider" ]]; then
    echo ${APPLICATION}
    TARGET_INSTALL_PATH="system/priv-app"
fi 

if [ ${ANDROID_VERSION:0:1} = "5" ]; then
    TARGET_INSTALL_PATH=${TARGET_INSTALL_PATH}"/"${APPLICATION}
fi
echo ${TAG}"target_path____:"${TARGET_INSTALL_PATH}

# 判断是否remount成功, 如果失败, 那么exit status $? 为1, 然后vivoroot, 等待2s, 使得root成功
# remount_status=$(adb remount)
adb remount | grep succeeded
if [[ $? -eq 1 ]]; then
    adb vivoroot
    sleep 2s
    adb remount
fi


if [[ ${APPLICATION} = "MediaProvider" ]]; then
    echo "adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
    adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
    adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"

    adb shell rm -rf data/data/com.android.providers.media
    adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///storage/sdcard0
    adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///storage/sdcard1
    #adb shell am braodcast -a android.intent.action.BOOT_COMPLETED
else
    adb shell ps | grep -i ${PACKAGENAME} | awk '{print $9}' | xargs adb shell am force-stop
    echo "adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
    adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
    adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"
fi




