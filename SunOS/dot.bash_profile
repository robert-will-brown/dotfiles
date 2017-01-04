#
# ioko ISB root .bash_profile
#
# VERSION: 1.0
#
#
#

#
# Use vi keybindings cause arrow buttons are for wimps
#
set -o vi


#
# Setup the Solaris Environment
#
if [ "${TERM}" = "xterm-color" ]; then
	# We're probably logged on from my Mac, reset the term
	# to somthing Solaris knows about
	export TERM=xterm
fi


#
# PATHS
#
PATH=/sbin:/usr/sbin:/usr/bin:/usr/dt/bin
PATH=$PATH:/usr/ccs/bin:/usr/openwin/bin:/usr/sfw/bin
PATH=$PATH:/usr/ucb:/usr/platform/`uname -i`/sbin
PATH=$PATH:/usr/local/bin

# Put additional directories here.
# They will be tested for existence before they are added
for BINDIR in \
/root/bin \
/opt/sfw/bin \
/opt/SUNWldm/bin \
/opt/IOKOtools/bin \
/opt/SUNWsneep/bin \
/opt/SUNWexplo/bin \
/opt/VRTS/bin \
/opt/VRTSvcs/bin \
/opt/VRTSvxfs/bin \
/opt/VRTSvxvm/bin 
do
	test -d ${BINDIR} && PATH=$PATH:${BINDIR} 
done

#
# MANPATHS
#
MANPATH=/usr/share/man:/usr/dt/share/man:/usr/sfw/man
MANPATH=$MANPATH:/usr/local/man:/usr/openwin/man

# Put additional directories here.
# They will be tested for existence before they are added
for MANDIR in \
/opt/SUNWldm/man \
/opt/sfw/man \
/opt/IOKOtools/man \
/opt/SUNWsneep/man \
/opt/SUNWexplo/man \
/opt/VRTS/man \
/opt/VRTSvcs/man \
/opt/VRTSvxfs/man \
/opt/VRTSvxvm/man 
do
	test -d ${MANDIR} && MANPATH=$MANPATH:${MANDIR} 
done

# Log user out if they've been idle for half hour (1800 secs)
TMOUT=1800

# 
# LD_LIBRARY PATH shouldnt be set if it can be avoided.
#
#LD_LIBRARY_PATH=/usr/local/lib:/usr/sfw/lib

export PATH MANPATH LD_LIBRARY_PATH

export EDITOR=vim

#
# Source other files
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_`hostname` ]; then
	. ~/.bash_`hostname`
fi


# Give me some space man.
echo ""
