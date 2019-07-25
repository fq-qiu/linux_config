# bash shell
# 先备份原有的.bashrc, 再使用自定义的
# ln -s source_file target_file

if [ ! -L ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc_backup
fi
ln -s ./config_sh/bashrc ~/.bashrc
if [ ! -L ~/.bash_history ]; then
    mv ~/.bash_history ~/.bash_history_backup
fi
ln -s ./config_sh/bash_history ~/.bash_history

# zsh
# 先备份原有的.zshrc, 再使用自定义的
if [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc_backup
fi
ln -s ./config_sh/zshrc ~/.zshrc
if [ ! -L ~/.zsh_history ]; then
    mv ~/.zsh_history ~/.zsh_history_backup
fi
ln -s ./config_sh/zsh_history ~/.zsh_history
ln -s ./oh-my-zsh ~/.oh-my-zsh

# git
ln -s ./config_sh/gitignore ~/.gitignore
ln -s ./config_sh/gitconfig ~/.gitconfig
ln -s ./config_sh/git.init.templateDir ~/.git.init.templateDir

# tmux
if [ ! -d ~/.tmux ]; then
    ln -s ./tmux ~/.tmux
fi
ln -s ./config_sh/tmux.conf ~/.tmux.conf

# for AndroidStudio or Intellij IDEA plugin IdeaVim
ln -s ./config_sh/ideavimrc ~/.ideavimrc

# for vim
if [ ! -d ~/.vim ]; then
    ln -s ./vimfile ~/.vim
    cd ~/.vim
    echo | vim -u ~/.vim/vimrc +BundleUpdate +qall
fi

# # for ack
# ln -s ./config_sh/ackrc ~/.ackrc

# for ssh
mkdir ~/.ssh
ln -s ./config_sh/ssh-config ~/.ssh/config
# cd ~/.ssh
# yes | ssh-keygen -P "" -t rsa -b 4096 -f ~/.ssh/github.com
# yes | ssh-keygen -P "" -t rsa -f ~/.ssh/coding.net
chmod 600 ~/.ssh/*

# for show markdown toc in vim tagbar
ln -s ./config_sh/ctags ~/.ctags


# for iptables, block some online game show sites
iptables-restore < config_sh/iptables.rules
echo "pre-up iptables-restore < /etc/iptables.up.rules" >> /etc/network/interfaces
echo "post-down iptables-save > /etc/iptables.up.rules" >> /etc/network/interfaces

# crontab rm: /bin/rm ~/.tmp_reconvery every week
(crontab -l 2>/dev/null; echo "10 4 * * 1 /bin/rm -rf ~/.rm_recovery") | crontab -

# to solve ubuntu linux unzip compressed file Chinese garbage problem
sed -i '$a UNZIP = "-O CP936"' /etc/environment
sed -i '$a ZIPINFO = "-O CP936"' /etc/environment

# pip使用国内镜像源
mkdir -p ~/.pip/
ln -s ./config_sh/pip.conf ~/.pip/pip.confg


# fonts
ln -s ./fonts ~/.fonts
fc-cache -vf
