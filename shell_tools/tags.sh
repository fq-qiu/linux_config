CURRENT_PATH=`pwd`

find $CURRENT_PATH -iname "*.java" -o -name "*.xml" -o -name "*.h"  -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.aidl" -o -name "*.py"| grep -v .plus > ./cscope.files

# find $CURRENT_PATH -iname "*.xml" >> ./cscope.files
# find $CURRENT_PATH  -name "*.h" -o -name "*.c" -o -name "*.cc"  -o -name "*.cpp" >> cscope.files

ctags --fields=+i -n -R -L ./cscope.files

cscope -bkq -i ./cscope.files
