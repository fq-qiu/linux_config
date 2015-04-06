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
自定以参数
```
mcapture 50 file_name.png #截屏原图为screen_original.png, 缩小率为%50x%50, 缩小后的图片为file_name.png
```
###mtags###
```
mtags       #在当前目录下生成vim的cscope和tag文件
```

