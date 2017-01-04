#
# ioko ISB root .bashrc
#
# VERSION: 1.0
#
#
# We need extglob turned on, so save the current value
declare oldextglob=$( shopt extglob )
shopt -s extglob
declare settitle setcoloron setcoloroff
# set up complicated prompt stuff based on terminal type
case $TERM in
	dtterm*|*xterm*|screen*|linux)
		# These use the basic ANSI color sequences.
		setcoloroff="\[\033[0m\]"
		if (( ! $UID )); then
			# we are root... make the prompt red
			setcoloron="\[\033[0;31m\]"
		else
			# non-root, but I still like color
			setcoloron="\[\033[1;32m\]"
		fi
		if [[ $TERM == +(*xterm*|dtterm*|screen*) ]]; then
			# These terminals have a title that can be set.
			# This magic came from one of the linux HOWTOs
			#PS1='\[\033]0;\h: \w\007\]\h:\W\$ '
			case $TERM in
			*xterm*|dtterm*)
				settitle="\[\033]0;\h: \w\007\]"
			;;
			screen*)
				# for screen I want to set the window title to only
				# the hostname, and use the hardstatus for the path.
				# The escape sequences to set the hardstatus are the
				# same as those to set the title in xterm.
				settitle='\[\033k\h\033\\\033]0;\w\007\]'
			;;
			esac
		fi
		;;
		*)
			# Nothing special here
		;;
esac

#
# Uncomment this section to allow the PS1 prompt to show the 
# physical hostname even in a zone.
#
##HOSTID=$(/usr/bin/hostid)

##ZONE_NAME=$(/sbin/zonename)
##if [ "${ZONE_NAME}" = "global" ]; then
##	PHYSICAL_HOSTNAME="global"
##else
##	if [ -f /etc/physicalhardware ]; then
##		PHYSICAL_HOSTNAME=$(cat /etc/physicalhardware \
##			|grep "^PHYSICAL_HOSTNAME:" \
##			|awk '{print $2}')
##	else
##		PHYSICAL_HOSTNAME="unknown_zonehost"
##	fi
##fi
##declare basicprompt='\h-[${PHYSICAL_HOSTNAME}]:\W\$'

if [ "`zonename`" = "global" ]; then
	declare basicprompt='\h:\W\$'
else
	declare basicprompt='\h-[ZN]:\W\$'
fi

PS1="${settitle}${setcoloron}${basicprompt}${setcoloroff} "


# Remove any exporting of PS1 since it looks hideous in other shells and 
# bash will just re-read this file anyway
export -n PS1

# set extglob back to how we found it
[[ $oldextglob == *off ]] && shopt -u extglob
unset basicprompt settitle setcoloron setcoloroff oldextglob

#
# Change pager.
#
unalias less 2>/dev/null
if [[ $(type -p less) ]]; then
   # without less man is harder to navigate.
   export PAGER="less -si"
else
   # We don't have less, but in case you type it... 
   alias less=more
fi

#
# Use top if it's available 
#
unalias top 2>/dev/null
if [[ ! $(type -p top) ]]; then
   alias top="/usr/bin/prstat -s cpu"
fi


#
# Use vim if it's available 
#
if [[ -x /usr/local/bin/vim ]]; then
        alias vi="vim -X "
fi


#
# All other Aliases here
#
alias ll="ls -l"
alias l="echo *"

