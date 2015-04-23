#!/bin/sh 

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

