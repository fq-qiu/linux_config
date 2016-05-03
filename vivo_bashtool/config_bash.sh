alias mbianyi='. ~/linux_config/vivo_bashtool/compile_server.sh'
alias minstall='. ~/linux_config/vivo_bashtool/locale_install.sh'


function current_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    refs=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

function remote_branch {
    currnt_branch=$(current_branch)
    ref=$(git config -l | grep ${currnt_branch}".merge")
    echo ${ref##*/}
}

function repository {
    ref=$(git config -l | grep "origin.url")
    echo ${ref##*/}
}
alias plog='plus git-log --author=qiufuqing ./'
alias previewer='plus changes-query --reviewers ./'
alias ppush='git push origin HEAD:refs/for/$(remote_branch) 2>&1 |tee .commit_temp'
alias pmansuo='. ~/linux_config/vivo_bashtool/plus_revision.sh'
alias padd='. ~/linux_config/vivo_bashtool/plus_add.sh'
alias mdatabase='adb pull /data/data/com.android.providers.media/databases'

