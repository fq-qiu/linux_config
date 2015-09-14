##############################################################################
####Introduction####
# A shell script to install apps based on the .commit_tmp from the remote
# compile server. All information can be get by parsing .commit_tmp
# 
####Usage####
# 1> minstall
#    just install, remove the database of MediaProvider
# 2> minstall update
#    just install, reserve the database of MediaProvider
# 
##############################################################################

CURRENT_PATH=`pwd`
TAG="__________"
COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

APPLICATION_ORIGINAL_PATH=`tail -50 .compile_tmp | grep -P "^Install.*apk" | awk '{print $2}'`
ANDROID_VERSION=`tail -50 .compile_tmp | grep -P "^Install.*apk" | awk -F/ '{print $4}'`
APPLICATION=`tail -50 .compile_tmp | grep -P "^Install.*apk" | awk -F/ '{print $7}'`
APPLICATION=${APPLICATION%.*}
#rm .compile_tmp
echo ${TAG}"sdk_version"${TAG}${ANDROID_VERSION}
echo ${TAG}"application"${TAG}${APPLICATION}

PACKAGENAME=${APPLICATION}
TARGET_INSTALL_PATH="system/app"
if [[ ${APPLICATION} = "BBKVideoPlayer" ]]; then
    echo ${APPLICATION}
    PACKAGENAME="VideoPlayer"
fi

# 判断是否remount成功, 如果失败, 那么exit status $? 为1, 然后vivoroot, 等待3s, 使得root成功
# remount_status=$(adb remount)
adb remount | grep succeeded
if [[ $? -eq 1 ]]; then
    adb vivoroot
    sleep 3s
    adb remount
fi

# android 4.2
if [ ${ANDROID_VERSION:0:3} = "4.2" ]; then
    echo ${TAG}"android4.2"
    TARGET_INSTALL_PATH="system/app"
    if [[ ${APPLICATION} = "MediaProvider" ]]; then
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"

        adb shell rm -rf data/data/com.android.providers.media
        #adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///storage/sdcard0
        #adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///storage/sdcard1
        #adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///storage/otg
        adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file
        adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n com.android.providers.media/.MediaScannerReceiver
    else
        adb shell ps | grep -i ${PACKAGENAME} | awk '{print $9}' | xargs adb shell am force-stop
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"
    fi
# android 4.4
elif [ ${ANDROID_VERSION:0:3} = "4.4" ]; then
    echo ${TAG}"android4.4"
    if [[ ${APPLICATION} = "MediaProvider" ]]; then
        TARGET_INSTALL_PATH="system/priv-app"
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"

        adb shell rm -rf data/data/com.android.providers.media
        adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file
        adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n com.android.providers.media/.MediaScannerReceiver
    else
        TARGET_INSTALL_PATH="system/app"
        adb shell ps | grep -i ${PACKAGENAME} | awk '{print $9}' | xargs adb shell am force-stop
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"
    fi
# beyond android 5.0
elif [ ${ANDROID_VERSION:0:1} = "5" ]; then
    echo ${TAG}"android5.0"
    if [[ ${APPLICATION} = "MediaProvider" ]]; then
        TARGET_INSTALL_PATH="system/priv-app/"${APPLICATION}
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"

        if [[ $# -eq 0 ]]; then
            echo ${TAG}"Not update, remove the original Database and recreate it"
            # clear database associated with MediaProvider
            adb shell pm clear com.android.providers.media
            adb shell rm -rf data/data/com.android.providers.media
        else
            echo ${TAG}"Database Update, not remove the original data"
        fi
        # android 5.0 and beyond don't allow pm uninstall, so just copy the apk to system/priv-app
        # and install the apk to data/app.Then use the apk in data/app
        # After reboot, the system found system/priv-app and data/app both have installed apk then
        # use the apk in system/priv-app
        adb install -r ${APPLICATION_ORIGINAL_PATH}
        # adb shell pm uninstall com.android.providers.media
        # adb shell pm install system/priv-app/MediaProvider/MediaProvider.apk
        # adb shell pm install-create -r data/MediaProvider.apk
        # adb shell kill -9 `adb shell ps | grep -i zygote | awk '{print $2;}'`
        adb shell pm path com.android.providers.media
        # Send broadcast to recreate the database
        # to timely show the results in media apps listview, like audio, video, image,
        # media broadcasts are sended first
        adb shell am broadcast -a MEDIA_SCANNER_SCAN_VIDEO_FILE -d file:///storage/emulated/0 -n com.android.providers.media/.MediaScannerReceiver
        adb shell am broadcast -a MEDIA_SCANNER_SCAN_AUDIO_FILE -d file:///storage/emulated/0 -n com.android.providers.media/.MediaScannerReceiver
        adb shell am broadcast -a MEDIA_SCANNER_SCAN_IMAGE_FILE -d file:///storage/emulated/0 -n com.android.providers.media/.MediaScannerReceiver
        adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n com.android.providers.media/.MediaScannerReceiver
    else
        TARGET_INSTALL_PATH="system/app/"${APPLICATION}
        adb shell ps | grep -i ${PACKAGENAME} | awk '{print $9}' | xargs adb shell am force-stop
        echo ${TAG}"adb push "${APPLICATION_ORIGINAL_PATH}" "${TARGET_INSTALL_PATH}"/"${APPLICATION}
        adb shell rm ${TARGET_INSTALL_PATH}"/"${APPLICATION}"*"
        adb push ${APPLICATION_ORIGINAL_PATH} ${TARGET_INSTALL_PATH}"/"
    fi
fi







