
###############################################################################
# vivo plus
###############################################################################


alias plog='plus git-log --author=qiufuqing ./'
###############################################################################


alias previewer='plus changes-query --reviewers ./'
###############################################################################


# 提交并添加reviews

function currnt_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    refs=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

function remote_up_branch() {
    current__branch=$(currnt_branch)
    ref=$(git branch -vv | grep -E "$current__branch" | sed -e 's/.*\/\(.*\):.*/\1/') || return
    echo ${ref}
} 

alias ppush='git push origin HEAD:refs/for/$(remote_up_branch) 2>&1 | tee ./.qiufuqing.commit'
#alias ppush='git push origin HEAD:refs/for/$(remote_up_branch)'
###############################################################################


# 添加reviewers
function review_id() {
    ref=$(cat ./.qiufuqing.commit | tail -4 | sed -n '1p' | awk -F/ '{print $5}') || return
    echo ${ref}
}

function repository_id() {
    ref=$(cat ./.qiufuqing.commit | tail -2 | sed -n '1p' | sed -e 's/.*git:\(.*\)\/Vivo.*/\1/') || return 
    echo ${ref}
}

function plus_add_reviewers() {
    _f_review_id=$(cat ./.qiufuqing.commit | tail -4 | sed -n '1p' | sed -n '1p' | awk -F/ '{print $5}')
    _f_repository_id=$(cat ./.qiufuqing.commit | tail -2 | sed -n '1p' | sed -e 's/.*git:\(.*\)\/Vivo.*/\1/')
    ssh -p ${_f_repository_id} qiufuqing@smartgit gerrit set-reviewers `echo ${_f_review_id}` --add qiufuqing
    #ssh -p ${repository_id} qiufuqing@smartgit gerrit set-reviewers 58850 --add qiufuqing
}

alias padd=plus_add_reviewers
###############################################################################



# 获取漫索提交信息
function get_revision() {
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo ${ref}
}
alias pmansuo='plus changes-query --revision $(get_revision)'
###############################################################################


