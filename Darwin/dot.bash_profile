#
# Robs .profile for macOS
#

# Define some variables.
BOLD_RED="\033[1;31m"
NORMAL="\033[0m"

set bell-style off

HISTFILESIZE=10000

# Set Editor
EDITOR=vim
SVN_EDITOR=vim
export SVN_EDITOR HISTFILESIZE EDITOR

CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR LSCOLORS

# Test for directories and add to path if they exist.
for DIR in \
	"/usr/local/bin" \
	"${HOME}/bin" \
	"/Developer/usr/bin" \
	"/Applications/MAMP/Library/bin" \
	"/opt/local/bin" \
	"/opt/local/sbin" \
	"/Applications/VMware OVF Tool" \
	"/Applications/VMware Fusion.app/Contents/Library" \
	"/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool"
	do
		if [ -d "${DIR}" ]; then
			PATH=$PATH:${DIR}
		fi
done
export PATH


# Fortune Coolness
#echo ""
##if [ -x /usr/local/bin/fortune ];
##then 
##		/usr/local/bin/fortune -e \
##			1%  ~/Shared_App_Data/fortune/robquotes \
##			5% ~/Shared_App_Data/fortune/Poems \
##			24% ~/Shared_App_Data/fortune/Quotes_Dreams \
##			35% ~/Shared_App_Data/fortune/Quotes_Gandhi \
##			35% ~/Shared_App_Data/fortune/Quotes_Dalai_Lama 
##else
##	echo "No fortune :("
##fi
##echo ""

if [ -x /usr/local/bin/archey ]; then
	/usr/local/bin/archey
fi

# Show me Todays Tasks.
if [ -x "${HOME}/bin/things" ]; then
	echo ""
	echo -e "${BOLD_RED}- Todays Tasks -${NORMAL}"
	${HOME}/bin/things today \
		|grep -v "Things: list Today" \
		|fold -w 75 -s \
		|sed 's/*-/•/g' \
		|sed 's/*√/✔/g'
else 
	echo "\"things\" not found"
fi


# Show me todays remaining Events
if [ -x "/usr/local/bin/icalBuddy" ]; then
	EVENTS=$(/usr/local/bin/icalBuddy \
		-tf "%1I:%M %p" \
		-iep datetime,title \
		-ps "| / | -- |" \
		--includeOnlyEventsFromNowOn \
		 -po "datetime,title" \
		eventsToday \
		|grep "^• [0-9]")
	if [ -z "${EVENTS}" ]; then
		echo -e "${BOLD_RED}No Events for the rest of day.${NORMAL}"
	else
		echo -e "${BOLD_RED}- Todays Remaining Events -${NORMAL}"
		echo ${EVENTS}
	fi
	echo ""
else
	echo "icalBuddy not found"
fi


#
# Load in .bashrc for aliases, etc.
#
test -f ~/.bashrc && . ~/.bashrc
