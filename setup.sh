#!/bin/sh
DOTFILES_DIR=~/.dotfiles
OH_MY_ZSH_DIR=~/.oh-my-zsh
HOMEBREW_DIR=~/.homebrew

# Set the shell to Z shell
chsh -s $(which zsh)
echo "Shell is set to $SHELL"

# Clone dotfiles and oh-my-zsh
if [ -d "$DOTFILES_DIR" ]; then
    cd $DOTFILES_DIR && git pull --rebase
else
    echo "Cloning Dotfiles"
    git clone git@gitlab.sd.apple.com:avladimirov/dotfiles.git $DOTFILES_DIR
fi

if [ -d "$OH_MY_ZSH_DIR" ]; then
    cd $OH_MY_ZSH_DIR && git pull --rebase
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
if [ -e "/usr/local/bin/brew" ]; then
sudo rm -f /usr/local/bin/brew
fi
sudo ln -s ~/.homebrew/bin/brew /usr/local/bin/brew

echo "Installing git-extras"
cd /tmp 
if [ -d "git-extras"]; then
sudo rm -rf git-extras
fi 

$(cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)

echo "Installing zsh-syntax-highlighting"
cd $OH_MY_ZSH_DIR/custom/plugins
if [ -d "zsh-syntax-highlighting" ]; then
    cd zsh-syntax-highlighting
    sudo git pull --rebase
else 
    sudo git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
# TODO: 
# Pull source
# git-radars