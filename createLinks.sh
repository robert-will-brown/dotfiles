#
# Create Symlinks for these files to the root of my home dir
#

cd ~
DOTFILE_DIR="./dotfiles/$(uname -s)"

if [ -d ${DOTFILE_DIR} ]; then
	echo "Using ${DOTFILE_DIR}..."
else
	echo "Directory ${DOTFILE_DIR} not found."
	exit
fi

test -f ${DOTFILE_DIR}/dot.bash_profile && \
	ln -s ${DOTFILE_DIR}/dot.bash_profile ~/.bash_profile

test -f ${DOTFILE_DIR}/dot.bashrc && \
	ln -s ${DOTFILE_DIR}/dot.bashrc ~/.bashrc

test -f ${DOTFILE_DIR}/dot.bash_prompt && \
	ln -s ${DOTFILE_DIR}/dot.bash_prompt ~/.bash_prompt

test -f ${DOTFILE_DIR}/dot.bash_aliases && \
	ln -s ${DOTFILE_DIR}/dot.bash_aliases ~/.bash_aliases

test -f ${DOTFILE_DIR}/dot.vimrc && \
	ln -s ${DOTFILE_DIR}/dot.vimrc ~/.vimrc

echo "done."
