This a auto configure script for my linux configure


##PreInstall

This is tested on ubuntu15.10.

'git` and `vim` should be installed previously.

##Install##

- download
```
git clone --recursive https://github.com/tainzhi/linux_config.git
cd linux_config
git submodule foreach --recursive git checkout master
```

- configure
```
sudo sh software.sh     # install some softwares
sudo sh install.sh      # make some alias to customize the system
```
- uninstall
```
sudo sh uninstall.sh    # delete some alias
```


##Some help and readme

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

- zsh

[zsh README](./readme/zsh_readme.md)

[zsh configure](https://zybuluo.com/mdeditor#40808)

- tmux

because of 'tmux-plugins/tmux-continuum`, tmux will restore sessions

[tmux README](./readme/tmux_readme.md)

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

自定义的shell脚本

### mbianyi ###
```
mbianyi app-project-path
```
编译apk, 并把输出结果写入到当前目录的.commit_tmp, 供本地的`minstall`使用

### minstall ###
```
minstall
minstall update
```
解析从远程编译服务器同步过来的`.commit_tmp`本地安装apk, 有`update`参数时, 不清楚MediaProvider的database, 如果没有则清除, 重新生成database

### mkill ###
杀死android device的名为的进程, 名称可以是正则表达式
```
mkill *float*       #杀死符合正则表达式规则的*float*进程
```

### mcapture ###
android device解屏并保存到当前目录, 同时也能缩小图片, 用于博客等. 有两种用法
默认参数
```
mcapture            #截屏原图为screen_original.png, 缩小率为%30x%30, 缩小后的图片为thumnail.png
```
自定义参数
```
mcapture 50 file_name.png #截屏原图为screen_original.png, 缩小率为%50x%50, 缩小后的图片为file_name.png
```
###mtags###
```
mtags       #在当前目录下生成vim的cscope和tag文件
```
### myrm ###
防止/bash/rm误删文件, 便于恢复

- 用alias连接myrm.sh为rm, 把要删除的文件放到`~/.rm_recovery`下
- 如果要完全删除该命令, 可以使用`/bin/rm`
- 通过crontab命令, 定义定时任务, 每周清理一次该目录
- crontab命令通过`linux_config/install.sh`添加, 并通过`linux_config/unisntall.sh`删除
- 如果批量删除, `rm test\*`,末尾添加星号

###msplit###
切分文件
```
msplit --help
```

### mdatabase ###
```
mdatabase 1501_db_1 #拷贝出data/data/com.android.providers.media/databases
```

##File Stucture

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
    +-- vivo_bashtool: my bash tools with vivo
    +-- install.sh: create alias 
    +-- software.sh: the script to uninstall some softwares
    +-- uninstall.sh:  delete alias

The files in `config_sh` are symbolinked into `$HOME` by `sh install.sh` and then take effect.

##Functions
- install some softwares,`g++`, `python`, `zsh`, `autojump`, `tmux`
- install some tools for vim, `cscope`, `ctags`, `ack`
- install some libs to compatible i386 for android tools
- my bash/zsh configure
- my tmux configure
- my vim configure
- my ssh configure
- for iptables, block some online game show sites ip
- some shell scripts tools
