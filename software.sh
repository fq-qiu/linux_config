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
yes | apt-get install build-essential
yes | apt-get install automake libevent-dev libncurses5-dev libncurses5-dev
yes | apt-get install curl
yes | apt-get install cmake python-dev python-setuptools python3-dev
easy_install pip

# zsh
yes | apt-get install zsh
yes | apt-get install autojump
apt-get install -y xclip
# chsh -s /bin/zsh
sed -i "s/$USER\:\/bin\/bash/$USER\:\/bin\/zsh/g" /etc/passwd
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

# vim
apt-get install vim-gnome

# vim denpendency
apt-get install ctags cscope


## ack-2.14
### File-Next
cd $SOFTWARE_PATH
# if File-Next-1.16.tar.gz doesn't exist, then download it
if [ ! -f File-Next-1.16.tar.gz ]; then
    wget http://www.cpan.org/authors/id/P/PE/PETDANCE/File-Next-1.16.tar.gz
fi
# if not exists, then extract to get it
if [ ! -d File-Next-1.16 ]; then
    tar zxvf File-Next-1.16.tar.gz
    cd File-Next-1.16/
    perl Makefile.PL
    make
    make test
    make install
fi
###ack
cd $SOFTWARE_PATH
# if ack-2.15_01.tar.gz doesn't exist. then downloads it
if [ ! -f ack-2.15_02.tar.gz ]; then
    wget http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/ack-2.15_02.tar.gz 
fi
if [ ! -d ack-2.15_02 ]; then
    tar zxvf ack-2.15_02.tar.gz
    cd ack-2.15_02
    perl Makefile.PL
    make
    make test
    make install # for a system-wide installation (recommended)
fi

##ag
sudo apt-get install silversearcher-ag

#p7zip-full
yes | apt-get install p7zip-full

# Node.js, npm
sudo apt-get install Node.js npm

# compatible i386, for android mksdard tool
dpkg --add-architecture i386
apt-get install libncurses5:i386 libstdc++6:i386 zlib1g:i386 lib32z1 lib32ncurses5
