CURRENT_PATH=`pwd`

find $CURRENT_PATH -not -path "*build/generat*" -not -path "*intermediates/*" -not -path "*.plus*" -iname "*.java" -o -name "*.xml" -o -name "*.h"  -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.aidl" -o -name "*.py" -o -name "*.md" > ./cscope.files

ctags --fields=+i -n -R -L ./cscope.files

cscope -bkq -i ./cscope.files
