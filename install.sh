# bash shell
mv ~/.bashrc ~/.bashrc_backup
ln -s ./config_sh/bashrc ~/.bashrc

# zsh
ln -s ./config_sh/zshrc ~/.zshrc
ln -s ./oh-my-zsh ~/.oh-my-zsh

# git
ln -s ./config_sh/gitignore ~/.gitignore
ln -s ./config_sh/gitconfig ~/.gitconfig

# tmux
ln -s ./tmux ~/.tmux
ln -s ./config_sh/tmux.conf ~/.tmux.conf

# for AndroidStudio or Intellij IDEA plugin IdeaVim
ln -s ./config_sh/ideavimrc ~/.ideavimrc

# for vim
ln -s ./vimfile ~/.vim


