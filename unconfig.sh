# bash shell
if [ -L ~/.bashrc ]; then
    rm -rf ~/.bashrc
fi
mv ~/.bashrc_backup ~/.bashrc
if [ -L ~/.bash_history ]; then
    rm -rf ~/.bash_history
fi
mv ~/.bash_history_backup ~/.bash_history

# zsh
if [ -L ~/.zshrc ]; then
    rm -rf ~/.zshrc
fi
mv ~/.zshrc_backup ~/.zshrc
if [ -L ~/.zsh_history ]; then
    rm -rf ~/.zsh_history
fi
mv ~/.zsh_history_backup ~/.zsh_history
rm -rf ~/.oh-my-zsh

# git
rm -rf ~/.gitignore
rm -rf ~/.gitconfig
rm -rf ~/.git.init.templateDir

# tmux
rm -rf ~/.tmux.conf
if [ -L ~/.tmux ]; then
    rm -rf ~/.tmux
fi

# for AndroidStudio or Intellij IDEA plugin IdeaVim
rm -rf ~/.ideavimrc

# for vim
if [ -L ~/.vim ]; then
    rm -rf ~/.vim
fi

# # for ack
# rm -rf ~/.ackrc

# for ssh
rm -rf ~/.ssh

# for show markdown toc in vim tagbar
ln -s ~/.ctags

# for iptables, unblock some online game show sites
rm /etc/iptables.up.rules
iptables -F

# for rm crontab
crontab -l | grep -v rm_recovery | crontab -

# to solve ubuntu linux unzip compressed file Chinese garbage problem
sed -i '/ZIP/d' /etc/environment
