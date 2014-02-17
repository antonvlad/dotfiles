#!/bin/sh

# Set the shell to Z shell
chsh -s /usr/bin/zsh
echo "Shell is set to $SHELL"

# Clone dotfiles and oh-my-zsh
echo "Cloning Dotfiles"
git clone git://git@gitlab.sd.apple.com:avladimirov/dotfiles.git ~/.dotfiles

echo "Cloning Oh My Zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Set up symlinks
echo "Setting up symlinks"

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/anton-zsh-theme ~/.oh-my-zsh/themes/anton.zsh-theme

# Install tools 
echo "Installing git-up"
sudo gem install git-up

echo "Installing Homebrew"
mkdir .homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C .homebrew
ln -s ~/.homebrew/bin/brew /usr/local/bin/brew

echo "Installing git-extras"

brew install git-extras

# TODO: 
# Pull source
#  