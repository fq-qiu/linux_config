MAX_FILE_SIZE=38000000 #38M
SPLIT_FILE_SIZE=30M #20M

function_get_file_size() {
    # size=`stat -c %s $1 | tr -d '\n'`
    size=`stat -c %s $1`
    echo $size
}

function_file_split() {
    size=$(function_get_file_size $1)
    if [ $size -gt $MAX_FILE_SIZE ]; then
        split -C $SPLIT_FILE_SIZE $1 ${1}"_"
        rm $1
    fi
}

function_dir_recursive_split() {
    cd $1
    path=`pwd`
    for item in `ls $path`; do
        if [ -f $item ]; then
            function_file_split $item
        elif [ -d $item ]; then
            function_dir_recursive_split $path"/"$item
        fi
    done
}

function_help() {
    echo "**************************split help**************************************"
    echo "切分大于38M的大文件为30M大小的文件, 删除原文件, 切分后的文件名为原文件后添加后缀"
    echo "0个数"
    echo "1个参数 -h, --help              帮助文档"
    echo "1个参数 文件地址                切分文件"
    echo "1个参数 文件夹地址              递归切分文件夹中的大文件"
    echo "**************************************************************************"
}

if [ $# -eq 0 ] || ([ $# -eq 1 ] && ([ $1 = '-h' ] || [ $1 = '--help' ]))  ; then
    function_help
elif [ $# -eq 1 ] && [ -f $1 ]; then
    function_file_split $1
elif [ -d $1 ]; then
    function_dir_recursive_split $1
fi

