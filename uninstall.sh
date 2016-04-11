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

# tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tmux

# for AndroidStudio or Intellij IDEA plugin IdeaVim
rm -rf ~/.ideavimrc

# for vim
rm -rf ~/.vim

# for ack
rm -rf ~/.ackrc

# for ssh
rm -rf ~/.ssh

# for iptables, unblock some online game show sites
rm /etc/iptables.up.rules
iptables -F

# for rm crontab
crontab -l | grep -v rm_recovery | crontab -
