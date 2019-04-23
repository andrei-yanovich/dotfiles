#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 brew tap homebrew/bundle
 brew bundle
fi

brew update

#chsh -s $(which zsh)

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "README.md" \
	--exclude "dev.sh" \
	-avh --no-perms . $HOME/.dotfiles/;

#for file in ~/.{aliases,functions}; do
#	[ -r "$file" ] && [ -f "$file" ] && source "$file";
#done;
mkdir ~/.config/.nvm
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#rm -rf $HOME/.zshrc
#ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
#source ~/$HOME/.zshrc
# ./dev.sh
