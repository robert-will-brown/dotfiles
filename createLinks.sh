#
# Create Symlinks for these files to the root of my home dir
#

OSNAME=`uname -s`

echo "Creating links for ${OSNAME}..."

cd ~
test -f ~/dotfiles/${OSNAME}/dot.bash_profile && ln -s ~/dotfiles/${OSNAME}/dot.bash_profile ~/.bash_profile
test -f ~/dotfiles/${OSNAME}/dot.bashrc && ln -s ~/dotfiles/${OSNAME}/dot.bashrc ~/.bashrc
test -f ~/dotfiles/${OSNAME}/dot.vimrc && ln -s ~/dotfiles/${OSNAME}/dot.vimrc ~/.vimrc

echo "done."
