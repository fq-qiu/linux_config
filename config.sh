# bash shell
# 先备份原有的.bashrc, 再使用自定义的
# ln -s source_file target_file
DIR="$( cd "$( dirname "$0" )" && pwd )"
OS=$(uname -s)

# bash
ln -f -s ""$DIR""/config_sh/bashrc ~/.bashrc
ln -f -s "$DIR"/config_sh/bash_history ~/.bash_history

# zsh
ln -F -h -f -s "$DIR"/oh-my-zsh ~/.oh-my-zsh
ln -f -s "$DIR"/config_sh/zshrc ~/.zshrc
ln -f -s "$DIR"/config_sh/zsh_history ~/.zsh_history

# zsh plugin
echo $ZSH_CUSTOM # ~/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# git
ln -f -s "$DIR"/git/gitignore ~/.gitignore
ln -f -s "$DIR"/git/gitconfig ~/.gitconfig
ln -F -h -f -s "$DIR"/git/git.init.templateDir ~/.git.init.templateDir

# tmux
ln -f -s "$DIR"/config_sh/tmux.conf ~/.tmux.conf

# for AndroidStudio or Intellij IDEA plugin IdeaVim
ln -f -s "$DIR"/config_sh/ideavimrc ~/.ideavimrc

# for vim
if [ ! -d ~/.vim ]; then
    ln -F -h -f -s "$DIR"/vimfile ~/.vim
    cd ~/.vim || exit
    echo | vim -u ~/.vim/vimrc +BundleUpdate +qall
fi

# # for ack
# ln -s ./config_sh/ackrc ~/.ackrc

# for ssh
mkdir ~/.ssh
ln -f -s "$DIR"/config_sh/ssh-config ~/.ssh/config
# cd ~/.ssh
# yes | ssh-keygen -P "" -t rsa -b 4096 -f ~/.ssh/github.com
# yes | ssh-keygen -P "" -t rsa -f ~/.ssh/coding.net
chmod 600 ~/.ssh/*

# for show markdown toc in vim tagbar
ln -f -s "$DIR"/config_sh/ctags ~/.ctags


# crontab rm: /bin/rm ~/.tmp_reconvery every week
(crontab -l 2>/dev/null; echo "10 4 * * 1 /bin/rm -rf ~/.rm_recovery") | crontab -

if [ ${OS} = "Linux"  ]; then
    # to solve ubuntu linux unzip compressed file Chinese garbage problem
    sed -i '$a UNZIP = "-O CP936"' /etc/environment
    sed -i '$a ZIPINFO = "-O CP936"' /etc/environment

    # for iptables, block some online game show sites
    iptables-restore < config_sh/iptables.rules
    echo "pre-up iptables-restore < /etc/iptables.up.rules" >> /etc/network/interfaces
    echo "post-down iptables-save > /etc/iptables.up.rules" >> /etc/network/interfaces

    # fonts
    ln -F -h -f -s "$DIR"/fonts ~/.fonts
    fc-cache -vf
fi

# pip使用国内镜像源
mkdir -p ~/.pip/
ln -f -s "$DIR"/config_sh/pip.conf ~/.pip/pip.confg


