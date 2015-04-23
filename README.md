This a auto configure script for my linux configure

##Environment:

## ubuntu install software ##

following softwares should be installed:

- git
- tmux
- autojump
- zsh
- vim-gnome

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

## config ##
`linux_config/config_sh`目录

该目录下的配置文件都通过**软连接**连接到`~`目录下, `install.sh`生成软连接, `uninstall.sh`删除软连接
- bashrc
- zshrc
- gitconfig
- gitignore
- ackrc: ack命令的配置
- ideavimrc: vim配置for Android Studio vim plugin
- tmux.conf: tmux config
- bashrc_zshrc: bashrc和zshrc都source的文件, 包括一些配置和alias
