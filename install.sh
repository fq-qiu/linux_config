# bash shell
mv ~/.bashrc ~/.bashrc_backup
ln -s ~/linux_config/config_sh/bashrc ~/.bashrc

# zsh
ln -s ~/linux_config/config_sh/zshrc ~/.zshrc
ln -s ~/linux_config/oh-my-zsh ~/.oh-my-zsh

# git
ln -s ~/linux_config/config_sh/gitignore ~/.gitignore
ln -s ~/linux_config/config_sh/gitconfig ~/.gitconfig

# tmux
ln -s ~/linux_config/tmux ~/.tmux
ln -s ~/linux_config/config_sh/tmux.conf ~/.tmux.conf

# for AndroidStudio or Intellij IDEA plugin IdeaVim
ln -s ~/linux_config/config_sh/ideavimrc ~/.ideavimrc

# for vim
ln -s ~/linux_config/vimfile ~/.vim

# for ack
ln -s ~/linux_config/config_sh/ackrc ~/.ackrc

# crontab rm: /bin/rm ~/.tmp_reconvery every week
(crontab -l 2>/dev/null; echo "10 4 * * 1 /bin/rm -rf ~/.rm_recovery") | crontab -
