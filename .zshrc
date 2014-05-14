# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="bureau"
# ZSH_THEME="dogenpunk"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="muse"
#ZSH_THEME="wedisagree"
#ZSH_THEME="apple"
#ZSH_THEME="fishy"
ZSH_THEME="anton"

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias radars="git radars"
alias gmsg="git message | pbcopy | pbpaste"
alias ls="ls -la"
alias zconfig="emacs ~/.zshrc"
alias board="rbt"
alias boardp="rbt post"
alias htab="split_tab"
alias vtab="vsplit_tab"
alias gsave="git push --set-upstream desktop `git rev-parse --abbrev-ref HEAD`"
#setopt correctall
# setopt cshjunkiequotes
#setopt histignoredups
#setopt autocd
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew catimge encode64 git-extras osx rand-quote screen web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
 if [ -n "$PYTHONPATH" ]
then
        PYTHONPATH="${PYTHONPATH}:${HOME}/Library/Python/2.7/site-packages:${HOME}/Library/Python/2.6/site-packages"
else
        PYTHONPATH="${HOME}/Library/Python/2.7/site-packages:${HOME}/Library/Python/2.6/site-packages"
fi
export PYTHONPATH

export PATH="/Applications/Araxis Merge.app/Contents/Utilities:${HOME}/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:${PATH}"
export RADAR_USER=avladimirov

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

