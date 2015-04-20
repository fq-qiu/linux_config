#!/bin/sh 

dirpath=~/.rm_recovery
now=`date +%Y%m%d_%H_%M_%S_`  
filename=${now}$1  # 给已经删除的文件加一个时间前缀来标识删除时的精准时间 
if [ ! -d ${dirpath} ];then  
        /bin/mkdir -p ${dirpath} 
 
        chmod 777 ${dirpath} 
  
fi  
/bin/mv $1 ${dirpath}/${filename}
