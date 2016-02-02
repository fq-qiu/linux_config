# 编译app, 并把编译信息输出到.compile.tmp

COMMON_APPLICATION=("BBKVideoPlayer" "UpnpServer" "AudioEffect" "FlaotingWindow")
SYSTEM_APPLICATION=("MediaProvider")

#get absolute path of $1
ABS_PATH=`cd "$1"; pwd`
# change timestap of AndroidManifest.xml
ANDROID_MANIFEST_XML=${ABS_PATH}"/AndroidManifest.xml"
touch ${ANDROID_MANIFEST_XML}

mmm $1 2>&1 | tee .compile_tmp

