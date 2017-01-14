#zsh README or command cheets

###about zsh
```
zsh_stats               # get a list of the top ten comands and how many times they have been run
upgrade_oh_my_zsh       # upgrade
```
### ~/.oh-my-zsh/lib/directories.zsh ###
```
~               # the home directory

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
```

###clipcopy - Copy data to clipboard

```
<command> | clipcopy    - copies stdin to clipboard
clipcopy <file>         - copies a file's contents to clipboard
```

###clippaste - "Paste" data from clipboard to stdout

```
clippaste   - writes clipboard's contents to stdout
clippaste | <command>    - pastes contents and pipes it to another process
clippaste > <file>      - paste contents to a file
```


## plugins ##
###history-sustring-search

- Type any part of any previous command and then:

    Press the UP arrow key to select the nearest command that (1) contains your query and (2) is older than the current command in the command history.

    Press the DOWN arrow key to select the nearest command that (1) contains your query and (2) is newer than the current command in the command history.

    Press ^U (the Control and U keys simultaneously) to abort the search.

- If a matching command spans more than one line of text, press the LEFT arrow key to move the cursor away from the end of the command, and then:

    Press the UP arrow key to move the cursor to the line above. When the cursor reaches the first line of the command, pressing the UP arrow key again will cause this script to perform another search.

    Press the DOWN arrow key to move the cursor to the line below. When the cursor reaches the last line of the command, pressing the DOWN arrow key again will cause this script to perform another search.


### extract ###
Extract an archive (supported types: tar.{bz2,gz,xz,lzma}, bz2, rar, gz, tar, tbz2, tgz, zip, Z, 7z).
```
x archive_file.xx
```

### git ###
```
gst     git status
gl      git pull
gp      git push
gd      git diff
gc      git commit -v
gc!     git commit -v -amend
gcf     git config --list
gco     git checkout
gcm     git checkout master
gr      git remote
gb      git branch
gcf     git config --list
ga      git add
gm      git merge
gre     git reset

alias glo='git log --oneline --decorate --color'

alias glog='git log --oneline --decorate --color ---graph'
```
