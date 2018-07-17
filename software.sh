SOFTWARE_PATH="/home/muqing/Downloads/software"

if [ -d $SOFTWARE_PATH ]; then
    echo $SOFTWARE_PATH
else
    mkdir -p ${HOME}"/software_install"
    SOFTWARE_PATH=${HOME}"/software_install"
    echo $SOFTWARE_PATH
fi

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
apt-get -y install autojump
apt-get -y install xclip
# chsh -s /bin/zsh
# sed -i "s/$USER\:\/bin\/bash/$USER\:\/bin\/zsh/g" /etc/passwd
# just start the terminal and use zsh
# /usr/bin/env zsh


# tmux
cd $SOFTWARE_PATH
if [ ! -d tmux ]; then
    git clone https://github.com/tmux/tmux.git
    echo `pwd`
    cd ${SOFTWARE_PATH}"/tmux/"
    sh autogen.sh
    ./configure && make
    make install
    # rm -rf ${SOFTWARE_PATH}"/tmux/"
fi

# pycscope
cd $SOFTWARE_PATH
if [ ! -d pycscope ]; then
    git clone https://github.com/portante/pycscope
    echo `pwd`
    cd ${SOFTWARE_PATH}"/pycscope/"
    python setup.py install
    # rm -rf ${SOFTWARE_PATH}"/pycscope/"
fi

# vim
apt-get -y install vim-gnome

# vim denpendency
apt-get -y install ctags cscope

##ag
apt-get -y install silversearcher-ag

#p7zip-full
apt-get -y install p7zip-full

# Node.js, npm
apt-get -y install Node.js npm

# compatible i386, for android mksdard tool
dpkg --add-architecture i386
apt-get -y install libncurses5:i386 libstdc++6:i386 zlib1g:i386 lib32z1 lib32ncurses5

# python3 libs
apt-get -y install python3-tk
pip3 install --upgrade autopep
pip3 install pygmo
pip3 install numpy
pip3 install matploblib
pip3 install deap


