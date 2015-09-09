SOFTWARE_PATH="/home/muqing/Downloads/software/"

# build essential
yes | apt-get install g++
yes | apt-get install build-essential
yes | apt-get install automake libevent-dev libncurses5-dev libncurses5-dev
yes | apt-get install cmake python-dev

# zsh
apt-get install zsh autojump
chsh -s /bin/zsh


# tmux
cd $SOFTWARE_PATH
git clone https://github.com/tmux/tmux.git
echo `pwd`
cd ${SOFTWARE_PATH}"tmux/"
sh autogen.sh
./configure && make
make install


# vim denpendency
apt-get install ctags cscope
## vim plugin update
## install clang and YouCompleteMe
## ack-2.14
### File-Next
cd ${SOFTWARE_PATH}"File-Next-1.12/"
perl Makefile.PL
make
make test
make install
###ack
cd ${SOFTWARE_PATH}"ack-2.15_01/"
perl Makefile.PL
make
make test
make install # for a system-wide installation (recommended)

