#
# Create Symlinks for these files to the root of my home dir
#

DOTFILE_DIR="${HOME}/dotfiles/$(uname -s)"

if [ -d ${DOTFILE_DIR} ]; then
	echo "Using ${DOTFILE_DIR}..."
else
	echo "Directory ${DOTFILE_DIR} not found."
	exit
fi

cd ~

test -f ${DOTFILE_DIR}/dot.bash_profile && \
	ln -s ${DOTFILE_DIR}/dot.bash_profile ~/.bash_profile

test -f ${DOTFILE_DIR}/dot.bashrc && \
	ln -s ${DOTFILE_DIR}/dot.bashrc ~/.bashrc

test -f ${DOTFILE_DIR}/dot.vimrc && \
	ln -s ${DOTFILE_DIR}/dot.vimrc ~/.vimrc

echo "done."
