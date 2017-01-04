#
# Aliases
#

# macOS Finder
alias finderShowFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias finderHideFiles='defaults write com.apple.finder AppleShowAllFiles NO;  killall Finder /System/Library/CoreServices/Finder.app'
alias finderShowExtensions='defaults write NSGlobalDomain AppleShowAllExtensions -bool true'
alias finderHideExtensions='defaults write NSGlobalDomain AppleShowAllExtensions -bool false'

# cd to front macOS Finder window
cdf () {
	currFolderPath=$( /usr/bin/osascript <<EOT
		tell application "Finder"
			try
				set currFolder to (folder of the front window as alias)
				on error
				set currFolder to (path to desktop folder as alias)
			end try
		POSIX path of currFolder
	end tell
EOT
	)
	echo "cd to \"$currFolderPath\""
	cd "$currFolderPath"
}

# Screenshots
alias disableShadow='defaults write com.apple.screencapture disable-shadow -bool true'
alias enableShadow='defaults write com.apple.screencapture disable-shadow -bool false'

# Fun
alias starwars="telnet towel.blinkenlights.nl" # Star wars action

# Shell
alias ll='ls -lah'
cd() { builtin cd "$@"; ls; }				# List directory contents on 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias cp='cp -iv'							# 
alias mv='mv -iv'							# 
alias mkdir='mkdir -pv'   					# 
alias c="clear"								# 
alias l="ls"								# 
alias pp="ps -ef"							# 
alias f='open -a Finder ./'                 # Opens current directory in MacOS Finder
mcd () { mkdir -p "$1" && cd "$1"; }        # Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # Moves a file to the MacOS trash
alias DT='tee ~/Desktop/terminalOut.txt'    # Pipe content to file on MacOS Desktop

# Searching
alias qfind="find . -name "                 # Search for file

# Processes
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Networking
alias whatsmyip='curl -s https://api.ipify.org'                    # WAN IP Address
alias flushDNS='dscacheutil -flushcache'            # Flush DNS Cache

    
#
# Colour Stuff
#
DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\033"
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

##
# Shortcuts for Colored Text ( Bright and FG Only )
##

# DULL TEXT

BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

# BRIGHT TEXT
BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
BRIGHT_WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

# REV TEXT as an example
REV_CYAN="\[$ESC[${DULL};${BG_WHITE};${BG_CYAN}m\]"
REV_RED="\[$ESC[${DULL};${FG_YELLOW}; ${BG_RED}m\]"

PROMPT_COMMAND='export ERR=$?'

##PS1="${BRIGHT_CYAN}[${CYAN}\u@${CYAN}\h:${BRIGHT_CYAN}\w${BRIGHT_CYAN}]${NORMAL}\$ ${RESET}"

COLOR_BOLD="\[\e[1m\]"
COLOR_DEFAULT="\[\e[0m\]"
PS1="$COLOR_BOLD\u@\h \w \$ $COLOR_DEFAULT"

export CLICOLOR=1
COLOR_BOLD="\[\e[1m\]"
COLOR_DEFAULT="\[\e[0m\]"
PS1='[\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]\[\033[00m\]]\[\033[31m\]$ \[\033[00m\]'