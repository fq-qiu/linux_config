This a auto configure script for my linux configure

<!-- vim-markdown-toc GFM -->

* [PreInstall](#preinstall)
* [Install](#install)
* [需要安装配置的项目](#需要安装配置的项目)
* [Some help and readme](#some-help-and-readme)
    - [第三方开发工具](#第三方开发工具)
* [shell tools usage](#shell-tools-usage)
    - [mtags](#mtags)
    - [msplit](#msplit)
    - [gh-md-toc](#gh-md-toc)
    - [hhighlighte or h](#hhighlighte-or-h)
    - [mdatabase for android develop](#mdatabase-for-android-develop)
    - [mkill](#mkill)
    - [mcapture](#mcapture)
* [File Stucture](#file-stucture)
* [Functions](#functions)

<!-- vim-markdown-toc -->


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
## 需要安装配置的项目
- vim 和插件
- git: editor 为 vim -u vimrc.simple
- 添加字体：微软雅黑，宋体，Helivetica
- 替换 autojump（比 z.lua 慢 3 倍）, 使用 [z.lua](https://github.com/skywind3000/z.lua). 使用前要安装 lua5.3,clone z.lua 到用户目录，并在 zshrc 中设置
- 安装rg
- 安装fd, faster and better than find


## ssh 
遇到的问题` UNPROTECTED PRIVATE KEY FILE!`, 修改私钥文件权限
```bash
# github.com为github ssh的私钥文件
chmod 600 github.com
```
## Some help and readme

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
Android Stduio, Intellij IDEA, eclipse 都安装在`/opt/`下
各自的启动命令如下
```
anstudio        # android studio
idea            # Intellij IDEA
eclipse         # eclipse
```

## shell tools usage ##


### mtags ###
```
mtags       #在当前目录下生成 vim 的 cscope 和 tag 文件
```

### msplit ###
切分文件
```
msplit --help
```

### gh-md-toc

为 REAME.md 生成 toc 目录，[参考](https://github.com/ekalinin/github-markdown-toc.go)

```
gh-md-toc --help
gh-md-toc --depth 3  ./REAME.md #生成三层 toc 到标准输出
gh-md-toc ./README.md > ./1.txt   #生成全部 toc 到 1.txt
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
mdatabase 1501_db_1 #拷贝出 data/data/com.android.providers.media/databases
```
### mkill
杀死 android device 的名为的进程，名称可以是正则表达式
```
mkill *float*       #杀死符合正则表达式规则的*float*进程
```

### mcapture
android device 解屏并保存到当前目录，同时也能缩小图片，用于博客等。有两种用法
默认参数
```
mcapture            #截屏原图为 screen_original.png, 缩小率为 %30x%30, 缩小后的图片为 thumnail.png
```
自定义参数
```
mcapture 50 file_name.png #截屏原图为 screen_original.png, 缩小率为 %50x%50, 缩小后的图片为 file_name.png
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
       +-- ideavimrc: vim 配置 for Android Studio vim plugin ideavim
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
