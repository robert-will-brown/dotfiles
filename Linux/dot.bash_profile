#
# robert.will.brown@gmail.com
#

# Check if we are an EC2 instance.
if [ -f /sys/hypervisor/uuid ] && [ `head -c 3 /sys/hypervisor/uuid` == ec2 ]; then
	echo yes
else
	echo no
fi


# Get Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases

fi
