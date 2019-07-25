# build essential
apt-get -y install g++
apt-get -y install build-essential
apt-get -y install automake libevent-dev libncurses5-dev libncurses5-dev
apt-get -y install curl
apt-get -y install cmake python-dev python-setuptools python3-dev python3-pip
yes | pip3 install --upgrade pip
apt-get -y remove python3-pip

# zsh
apt-get -y install zsh
apt-get -y install xclip
# chsh -s /bin/zsh
# sed -i "s/$USER\:\/bin\/bash/$USER\:\/bin\/zsh/g" /etc/passwd
# just start the terminal and use zsh
# /usr/bin/env zsh


# replace autojump with z.lua
apt-get -y install lua5.3
git clone https://github.com/skywind3000/z.lua ~/

# tmux
apt-get -y install tmux

# pycscope
pip3 install pycscope
# vim
apt-get -y install vim-gnome
# vim denpendency
apt-get -y install ctags cscope
# pycscope
pip3 install pycscope

## rg search
## if linux version >= 18.10, ripgrep can be installed by apt-install
## others, it can only be installed mannually
apt-get -y install ripgrep || curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb && dpkg -i ripgrep_11.0.1_amd64.deb

## better than find
apt-get -y fd-find

#p7zip-full
# apt-get -y install p7zip-full

# Node.js, npm
# apt-get -y install Nodejs npm

# compatible i386, for android mksdard tool
# dpkg --add-architecture i386
# apt-get -y install libncurses5:i386 libstdc++6:i386 zlib1g:i386 lib32z1 lib32ncurses5


zsh plugin
echo $ZSH_CUSTOM # ~/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
