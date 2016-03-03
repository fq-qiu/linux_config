#a bash to kill android process
TOBE_KILLED=""
if [ $# -lt 1 ]
then
    echo "DEFAUTL: kill zygote"
    TOBE_KILLED="zygote"
elif [ $# -eq 1 ]
then
    echo "SPECIFIC: kill "${1}
    TOBE_KILLED=$1
fi
# adb shell ps | grep -i $TOBE_KILLED
# process_id=`adb shell ps | grep -i $TOBE_KILLED | awk '{print $2;}'`
# adb shell kill -9 $process_id

adb shell ps | grep -i $TOBE_KILLED
for i in `adb shell ps |grep -i $TOBE_KILLED | awk '{print $2;}'`
do
    adb shell kill -9 $i
done

