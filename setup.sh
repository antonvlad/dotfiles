#!/bin/sh

# First order of business - clone dotfiles and oh-my-zsh
echo "Cloning Dotfiles"
git clone git://git@gitlab.sd.apple.com:avladimirov/dotfiles.git ~/.dotfiles

echo "Cloning Oh My Zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Set up symlinks
echo "Setting up symlinks"

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/anton-zsh-theme ~/.oh-my-zsh/themes/anton.zsh-theme

# Install tools 
sudo gem install git-up

# TODO: 
# Pull source
#  