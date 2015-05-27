#a bash to kill android process
adb shell ps | grep -i "$1"
process_id=`adb shell ps | grep -i "$1" | awk '{print $2;}'`
adb shell kill -9 $process_id

