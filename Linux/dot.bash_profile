#
# robert.will.brown@gmail.com
#

# Check if we are an EC2 instance.
if [ -f /sys/hypervisor/uuid ] && [ `head -c 3 /sys/hypervisor/uuid` == ec2 ]; then
	echo yes
else
	echo no
fi

HISTFILESIZE=10000

# Set Editor
EDITOR=vim
SVN_EDITOR=vim
export SVN_EDITOR HISTFILESIZE EDITOR

CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR LSCOLORS


#
# Load in .bashrc for aliases, etc.
#
test -f ~/.bashrc && . ~/.bashrc

