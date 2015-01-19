# capture the screen and save in sdcard/
adb shell system/bin/screencap -p sdcard/screenshot.png

adb pull /sdcard/screenshot.png ./screenshot.png
adb shell rm /sdcard/screenshot.png

# need to install imagemagick
# 'x' is alpabet x, not '*'
convert -resize 30%x30% screenshot.png thumbnail.png
