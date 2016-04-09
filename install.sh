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

# for ssh
mkdir ~/.ssh
ln -s ~/linux_config/config_sh/ssh-config ~/.ssh/config

# for iptables, block some online game show sites
iptables-restore < config_sh/iptables.rules
echo "pre-up iptables-restore < /etc/iptables.up.rules" >> /etc/network/interfaces
echo "post-down iptables-save > /etc/iptables.up.rules" >> /etc/network/interfaces

# crontab rm: /bin/rm ~/.tmp_reconvery every week
(crontab -l 2>/dev/null; echo "10 4 * * 1 /bin/rm -rf ~/.rm_recovery") | crontab -
