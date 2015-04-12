# need to install imagemagick
# capture the screen and save in sdcard/
adb shell /system/bin/screencap -p /sdcard/screenshot.png

adb pull /sdcard/screenshot.png ./screenshot_original.png
adb shell rm /sdcard/screenshot.png

# default orginal screenshot: screenshot_original.png
# default ration: 30%x30%, 'x' is alpabet x, not '*'
# default file name: thumbnail.png
# 
# if there are two parmaters input, first is ration, second is file_name
ration=30
file_name=thumbnail.png
echo " <1> 无参数:  生成thumbnail.png, 缩小比例30%"
echo " <2> 1个参数: 参数为图片名称, 缩小比例100%"
echo " <3> 2个参数: 参数1 缩小比例, 参数2 输出图片名称 "


if [ $# -lt 1 ]
then
    echo "You can inpute:       acapture ration file_name       "
elif [ $# -eq 1 ]
then
    echo " You can inpute the name for the orignial size screencapture"
    ration=100
    file_name=$1
elif [ $# -eq 2 ]
then
    ration=$1
    file_name=$2
fi

convert -resize ${ration}%x${ration}% screenshot_original.png ${file_name}
