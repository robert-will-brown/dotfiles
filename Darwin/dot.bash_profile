#
# Robs .profile for macOS
#
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
	/usr/local/bin \
	~/bin \
	"/Developer/usr/bin" \
	"/Applications/MAMP/Library/bin" \
	"/opt/local/bin" \
	"/opt/local/sbin" \
	"/Applications/VMware OVF Tool" \
	"/Applications/VMware Fusion.app/Contents/Library" \
	"/Applications//VMware Fusion.app/Contents/Library/VMware OVF Tool"
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


# Show me todays "things" tasks.
if [ -x "${HOME}/bin/things" ]; then
	echo ""
	${HOME}/bin/things today |fold -w 75 -s
else 
	echo "\"things\" not found"
fi


# Print My Calendar for Today
if [ -x "/usr/local/bin/icalBuddy" ]; then
	echo "Calendar:"
	/usr/local/bin/icalBuddy -n -b "*- " -f -npn  -iep "title,datetime,location" eventsToday
	echo ""
else
	echo "icalBuddy not found"
fi

# Use htop if available.
test -f  /usr/local/bin/htop && alias top="/usr/local/bin/htop"

#
# Load in .bashrc for aliases, etc.
#
test -f ~/.bashrc && . ~/.bashrc
