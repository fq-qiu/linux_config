for REVIEW_ID in `cat .commit_temp | grep http | awk -F/ '{print $5}' | awk '{print $1}'`; do
    echo $REVIEW_ID
    echo "http://smartgit/gerrit/#/c/"${REVIEW_ID}"/"
    ssh -p 29418 qiufuqing@smartgit gerrit set-reviewers $REVIEW_ID --add fengtianliang --add 洪斌斌 --add wangchaowxrjkf --add 李宰先
done
