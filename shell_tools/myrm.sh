#!/bin/sh 
# ### myrm ###
# 防止/bash/rm误删文件, 便于恢复
#
# - 用alias连接myrm.sh为rm, 把要删除的文件放到`~/.rm_recovery`下
# - 如果要完全删除该命令, 可以使用`/bin/rm`
# - 通过crontab命令, 定义定时任务, 每周清理一次该目录
# - crontab命令通过`linux_config/install.sh`添加, 并通过`linux_config/unisntall.sh`删除
# - 如果批量删除, `rm test\*`,末尾添加星号

dirpath=~/.rm_recovery
# now=`date +%Y%m%d_%H_%M_%S_`  
now=`date +%d_%H:%M:%S_`  
if [ ! -d ${dirpath} ];then  
        /bin/mkdir -p ${dirpath} 
 
        chmod 777 ${dirpath} 
fi  

TAG="_____________________________"
echo ${TAG}"Paramter_____"${1}
CRUEENT_PATH=`pwd`

star_symbol=${${1}:((${#1}-1))}
if [ $star_symbol = '*' ]; then
    filename=${${1}:0:((${#1}-1))}
    for i in $(ls -a ./ | grep ^${filename})
    do
        echo ${TAG}${i}
        /bin/mv $i ${dirpath}/${now}${i}
    done
else
    echo ${TAG}${1}
    /bin/mv $1 ${dirpath}/${now}${1}
fi
echo ${TAG}"success!!!"

