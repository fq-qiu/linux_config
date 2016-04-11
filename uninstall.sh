# bash shell
rm -rf ~/.bashrc
mv ~/.bashrc_backup ~/.bashrc
rm -rf ~/.bash_history
mv ~/.bash_history_backup ~/.bash_history

rm -rf ~/.zshrc
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
