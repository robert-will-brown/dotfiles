#
# Aliases
#

# AWS
alias ec2instance="aws ec2 run-instances --image-id ami-bfe0eadb --count 1 --instance-type t2.micro --key-name visual20-bastion-hosts --security-group-ids sg-e1bd4b88 --subnet-id subnet-0aab9f40"

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
alias mostUsedCommand="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"

# Searching
alias qfind="find . |grep -i "                 # Search for file

# Processes
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Networking
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flushDNS='dscacheutil -flushcache'            # Flush DNS Cache

# Software
alias installBrew='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
alias installBrewPackages="brew install nmap aws-shell wget dos2unix geoip htop imagemagick ffmpeg cowsay dockutil ical-buddy fortune terminal-notifier figlet whatmask  youtube-dl speedtest-cli trash thefuck archey pv tree lynx p7zip awscli Caskroom/cask/vlc rtmpdump shellcheck docker"
alias installBrewDeveloperPackages="brew install mongodb mysql cassandra memcached redis rdm elasticsearch node docker Caskroom/cask/java jenkins"



