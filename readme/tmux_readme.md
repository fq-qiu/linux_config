#tmux command sheets

The defaut prefix is **Ctrl+b**, but I change it to **Ctrl+x**

##tmux general
```
Ctrl + B + N        #下一个窗口
Ctrl + B + C        #创建窗口
Ctrl+B +Number      #Number为窗口数字编号, 选择窗口Number

Ctrl+B +:           #进入命令模式

Ctrl + B + [        #进入复制模式
Space               #开始复制
Enter               #复制到剪切板，并退出copy mode, 放在buffer中
# 当然, 重复如上的复制操作, 有多个buffer, 几buffer-list, 进入命令模式后, 输入choose-buffer即可选择某个buffer中的内容并copy
Ctrl + B + ]        #粘贴最近一个buffer中的内容

#把Ctrl+B映射成Ctrl+X
Ctrl + o            #在小窗口间跳转
Ctrl+x + |            #垂直分割
Ctrl+x + -            #水平分割
Ctrl+x Ctrl+q       #退出窗口，修改prefix为ctrl+x
Ctrl+x ,            #rename current window
exit                #exit current window/panel
Ctrl+x $            #rename session-name

Ctrl+x w            #以菜单方式选择窗口
Ctrl+x p            #选择上一个窗口
Ctrl+x n            #选择下一个窗口

Ctrl+x h/j/kl       #类vim, 上下左右选择pane
```

##[tmux plugin manager](https://github.com/tmux-plugins/tpm)

```
prefix + I          # install plugins
prefix + alt + u    # uninstall plugins
prefix + U          # update plugins
```

##[tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)

```
prefix + /          # regex search, examples, [0-9]+, search for numbers
prefix + ctrl-f     # simple file search
prefix + ctrl-d     # number search
```

copycat mode bindings

```
n                   # jumps to the next match
N                   # jumps to the previous match
```

to copy a hightlighted match
```
Enter              
```
Copying a highlighted match will take you "out" of copycat mode. Paste with prefix + ] (this is Tmux default paste).


##[tmux-yank](https://github.com/tmux-plugins/tmux-yank)

```
prefix + y          # copy text from the command line to clipboard
prefix + Y(shift-y) # copy pane current working directory to clipboard
```

**copy mode** binds

```
y                   # copy selection to system clipboard
Y (shift-y)         # "put" selection - equivalent to copying a selection, and pasting it to the command line
Alt-y               # performs both of the above: copy to system clipboard and put to command line (deprecated, not useful)
```


##[tmux-open](https://github.com/tmux-plugins/tmux-open)
n tmux copy mode:
```
o                   # "open" a highlighted selection with the system default program. open for OS X or xdg-open for Linux.
Ctrl-o              # open a highlighted selection with the $EDITOR
```


