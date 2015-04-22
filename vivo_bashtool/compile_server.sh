# 编译app, 并把编译信息输出到.compile.tmp

CURRENT_PATH=`pwd`
COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

# change timestap of AndroidManifest.xml
ANDROID_MANIFEST_XML=${CURRENT_PATH}"/"${1}"/AndroidManifest.xml"
touch ${ANDROID_MANIFEST_XML}

mmm $1 2>&1 | tee .compile_tmp

