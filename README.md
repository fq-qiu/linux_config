This a auto configure script for my linux configure


## PreInstall

This is tested on ubuntu15.10.

`git` should be installed previously.

## Install

- download
```
git clone --recursive https://github.com/tainzhi/linux_config.git
cd linux_config
git submodule foreach --recursive git checkout master
```

- configure
```
sudo sh software.sh     # install some softwares
sudo sh config.sh      # make some alias to customize the system
```
- add ssh key for github and coding.net
go to `~/.ssh/`, copy `github.com.pub` to [github](https://github.com/settings/keys), copy `coding.net.pub` to [coding.net](https://coding.net/user/account/setting/keys)
        
- uninstall
```
sudo sh unconfig.sh    # delete some alias
```


## Some help and readme

- autojump
```
j fo        # jump to the directory whose name has fo
jo fo       # open the file manager
```

- ack
```
ack -h      
ack "match"
ack -g "match"      # find dirs
```
- [ag](https://github.com/ggreer/the_silver_searcher)
ag is faster than ack, but search weaker than ack
```
ag -g file_name_string_match
ag file_string_match
man ag
```

- zsh

[zsh README](./doc/zsh_readme.md)

[zsh configure](https://zybuluo.com/mdeditor#40808)

- tmux

because of `tmux-plugins/tmux-continuum`, tmux will restore sessions

[tmux README](./doc/tmux_readme.md)

[tmux configure](https://zybuluo.com/mdeditor#56429)

### 第三方开发工具 ###
Android Stduio, Intellij IDEA, eclipse都安装在`/opt/`下
各自的启动命令如下
```
anstudio        # android studio
idea            # Intellij IDEA
eclipse         # eclipse
```

## shell tools usage ##


### mtags ###
```
mtags       #在当前目录下生成vim的cscope和tag文件
```

### msplit ###
切分文件
```
msplit --help
```

### gh-md-toc

为REAME.md生成toc目录, [参考](https://github.com/ekalinin/github-markdown-toc.go)

```
gh-md-toc --help
gh-md-toc --depth 3  ./REAME.md #生成三层toc到标准输出
gh-md-toc ./README.md > ./1.txt   #生成全部toc到1.txt
```

### hhighlighte or h
[hhighlighter](https://github.com/paoloantinori/hhighlighter), a tiny utility to highlight multiple keywords with different colors
```
$ h
usage: YOUR_COMMAND | h [-i] [-d] args...
	-i : ignore case
	-d : disable regexp
	-n : invert colors
```


### mdatabase for android develop
```
mdatabase 1501_db_1 #拷贝出data/data/com.android.providers.media/databases
```
### mkill
杀死android device的名为的进程, 名称可以是正则表达式
```
mkill *float*       #杀死符合正则表达式规则的*float*进程
```

### mcapture
android device解屏并保存到当前目录, 同时也能缩小图片, 用于博客等. 有两种用法
默认参数
```
mcapture            #截屏原图为screen_original.png, 缩小率为%30x%30, 缩小后的图片为thumnail.png
```
自定义参数
```
mcapture 50 file_name.png #截屏原图为screen_original.png, 缩小率为%50x%50, 缩小后的图片为file_name.png
```

## File Stucture

    +-- bin_tools: some tools in binary source for x86_64
       +-- gh-md-toc: 
    +-- config_sh: some configure files. For more deatils, to to seen some files, the precess only call to the one
       +-- ackrc: ack configure
       +-- bach_history
       +-- bashrc
       +-- bashrc_cygwin
       +-- bashrc_zshrc_general: the file which is sourced by bashrc and zshrc, including some alias and common configures
       +-- gitconfig
       +-- gitignore
       +-- iptables.rules: some rules to block some online game show ip
       +-- ideavimrc: vim配置for Android Studio vim plugin ideavim
       +-- ssh-config: config for ssh, for coding.net, github
       +-- tmux.conf: tmux config
       +-- zsh_history
       +-- zshrc
    +-- oh-my-zsh: submodules to oh-my-zsh
    +-- shell_tools: my customized shell tools
    +-- tmux: submodules to tmux plugins
    +-- vimfile: submodules to my Q-vim
    +-- config.sh: create alias 
    +-- software.sh: the script to uninstall some softwares
    +-- unconfig.sh:  delete alias

The files in `config_sh` are symbolinked into `$HOME` by `sh config.sh` and then take effect.

## Functions
- install some softwares,`g++`, `python`, `zsh`, `autojump`, `tmux`
- install some tools for vim, `cscope`, `ctags`, `ack`
- install some libs to compatible i386 for android tools
- my bash/zsh configure
- my tmux configure
- my vim configure
- my ssh configure
- for iptables, block some online game show sites ip
- some shell scripts tools
