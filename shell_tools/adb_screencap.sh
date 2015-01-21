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
if [ $# -lt 1 ]
then
    echo "You can inpute:       acapture ration file_name       "
elif [ $# -eq 2 ]
then
    ration=$1
    file_name=$2
fi

convert -resize ${ration}%x${ration}% screenshot_original.png ${file_name}
