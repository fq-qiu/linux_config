# bash shell
rm -rf ~/.bashrc
mv ~/.bashrc_backup ~/.bashrc

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

# for rm crontab
crontab -l | grep -v rm_recovery | crontab -
