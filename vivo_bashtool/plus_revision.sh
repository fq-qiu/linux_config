recent=("1" "2" "3" "4" "5")
for i in ${recent[@]}
do
    git log --oneline --decorate --color| sed -n "${i}p"
    prefix="[git:VivoCode/"$(repository)"|branch:"$(remote_branch)"|commit_id:"$(git log --oneline --decorate | sed -n "${i}p" | awk '{print $1}')"]"
    echo ${prefix}
    echo "*********************************************************************"
done
