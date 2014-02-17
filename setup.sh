#!/bin/sh
DOTFILES_DIR=~/.dotfiles
OH_MY_ZSH_DIR=~/.oh-my-zsh
HOMEBREW_DIR=~/.homebrew

# Set the shell to Z shell
chsh -s /usr/bin/zsh
echo "Shell is set to $SHELL"

# Clone dotfiles and oh-my-zsh
if [ -d "$DOTFILES_DIR" ]; then
    cd $DOTFILES_DIR && git pull --rebase
else
    echo "Cloning Dotfiles"
    git clone git://git@gitlab.sd.apple.com:avladimirov/dotfiles.git $DOTFILES_DIR
fi

if [ -d "$OH_MY_ZSH_DIR" ]; then
    cd $OH_MY_ZSH && git pull --rebase
else
    echo "Cloning Oh My Zsh"
    git clone git://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_DIR
fi

# Set up symlinks
echo "Setting up symlinks"

if [ -e "~/.zshrc" ]; then 
    rm ~/.zshrc
fi
ln -s $DOTFILES_DIR/.zshrc ~/.zshrc

if [ -e $OH_MY_ZSH_DIR/themes/anton.zsh-theme ]; then
    rm $OH_MY_ZSH_DIR/themes/anton.zsh-theme
fi
ln -s $DOTFILES_DIR/anton.zsh-theme $OH_MY_ZSH_DIR/themes/anton.zsh-theme

# Install tools 
echo "Installing git-up"
sudo gem install git-up

echo "Installing Homebrew"
mkdir ~/.homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C ~/.homebrew
ln -s ~/.homebrew/bin/brew /usr/local/bin/brew

echo "Installing git-extras"

/usr/local/bin/brew install git-extras

# TODO: 
# Pull source
# git-radars