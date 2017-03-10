# Shell
cd() { builtin cd "$@"; ls; }               # List directory contents on 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias cp='cp -iv'                           # 
alias mv='mv -iv'                           # 
alias mkdir='mkdir -pv'                     # 
alias c="clear"                             # 
alias ll='ls -lah'
alias l="ls -a"                             # 
alias pp="ps -ef"                           # 
mcd () { mkdir -p "$1" && cd "$1"; }        # Makes new Dir and jumps inside
