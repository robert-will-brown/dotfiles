#
# Aliases
#

#tmp
alias pythonlab="cd  ~/Documents/Areas/Tech/Python/Python\ Course/google-python-exercises/basic"
alias weather="ansiweather -l Fleet,UK"

# Apple Hardware
alias macRemainingBattery='pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d";"'
alias macScreenResolution="system_profiler SPDisplaysDataType | grep Resolution"
alias macStopSleep1hour="caffeinate -u -t 3600"
alias macMagsafeChargingSoundEnable="defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && open /System/Library/CoreServices/PowerChime.app"
alias macMagsafeChargingSoundDisable="defaults write com.apple.PowerChime ChimeOnAllHardware -bool false && killall PowerChime"
alias ejectall='osascript -e "tell application \"Finder\" to eject (every disk whose ejectable is true)"'

# Security
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias screensaver="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
 
# macOS Finder
alias finderShowFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias finderHideFiles='defaults write com.apple.finder AppleShowAllFiles NO;  killall Finder'
alias finderShowExtensions='defaults write NSGlobalDomain AppleShowAllExtensions -bool true; killall Finder'
alias finderHideExtensions='defaults write NSGlobalDomain AppleShowAllExtensions -bool false; killall Finder'
alias finderShowFullPath='defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder'
alias finderHideFullPath='defaults write com.apple.finder _FXShowPosixPathInTitle -bool false; killall Finder'

# macOS Dock
alias dockShowRecentAppsInDock="defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'; killall Dock"
alias dockReset="defaults delete com.apple.dock; killall Dock"

# Screenshots
alias disableShadow='defaults write com.apple.screencapture disable-shadow -bool true'
alias enableShadow='defaults write com.apple.screencapture disable-shadow -bool false'

# Fun
alias starwars="telnet towel.blinkenlights.nl" # Star wars action

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
alias f='open -a Finder ./'                 # Opens current directory in MacOS Finder
mcd () { mkdir -p "$1" && cd "$1"; }        # Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # Moves a file to the MacOS trash
alias DT='tee ~/Desktop/terminalOut.txt'    # Pipe content to file on MacOS Desktop
eval $(thefuck --alias)
alias dl="cd ~/Downloads"
alias downloads="cd ~/Downloads"

# Searching
alias qfind="find . |grep -i "                 # Search for file

# Processes
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Networking
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip=ip
alias flushDNS='dscacheutil -flushcache'            # Flush DNS Cache

# Software

# Office Admin
alias scanName="echo '2017-MM-DD COMPANY - Letter_Name'"
alias dateStamp="date +%Y%m%d-%H"

# AWS
setAWSProfile () {
	if [ "${1}" != "" ]; then
		echo $1 > ~/.aws_profilename
		export AWS_DEFAULT_PROFILE=$1
	fi

	echo $AWS_DEFAULT_PROFILE

}
alias awsprof=setAWSProfile
alias awsPersonna="echo you mean awsprof?"

alias s="subl ."

# Vagrant
VAGRANT_ROOT="~/vagrant"
alias vubuntu="cd ${VAGRANT_ROOT}/base/ubuntu-trusty; vagrant up; open http://localhost:8931; vagrant ssh ubuntu"
alias vcentos="cd ${VAGRANT_ROOT}/base/centos7; vagrant up; open http://localhost:8932; vagrant ssh centos"

#
# AT&T
#
alias devbas="ssh -i ~/Documents/Certificates/vcns-bastion.pem ubuntu@52.14.84.253"
alias dev-bastion="ssh rob@vcns-dev-bastion.integrated-digital.com"

alias dev-redis01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-redis01"
alias dev-couchbase01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-couchbase01"
alias dev-elasticsearch01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-elasticsearch01"
alias dev-vcs="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-vcs"
alias dev-notif01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-notif01"
alias dev-zookeeper01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-zookeeper01"
alias dev-api01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-api01"
alias dev-auth01="ssh -t -A rob@vcns-dev-bastion.integrated-digital.com ssh ubuntu@vcns-dev-auth01"
