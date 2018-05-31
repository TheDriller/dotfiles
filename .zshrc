
# pywal apply to new terminals
(cat ~/.cache/wal/sequences &)

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# add colorls to path (need to be installed via gem/ruby)
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

# add bin with custom scripts to path
export PATH=$HOME/.bin:$PATH

# Call neofetch at the beginning
neofetch

# Remove annoying system beep
xset -b

# Powerlevel for nerd font
POWERLEVEL9K_MODE="nerdfont-complete"

# oh_my_zsh theme to use
ZSH_THEME="powerlevel9k/powerlevel9k"

# remove the user@host
DEFAULT_USER="david"

plugins=(
  git
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# aliases
alias ls="colorls"

# Use wal, wal_zathura and wal_steam at once
function wal_total() {
	if (($# == 0))
		then echo "Must provide the path to a wallpaper"; 
	else
	    wal -g -i $1
	    wal_zathura
	    wal_steam -w
	    oomoxify-cli ~/.cache/wal/colors-oomox
	fi
}

# Use wal, wal_zathura and wal_steam at once, light theme
function wal_total_light() {
	if (($# == 0))
		then echo "Must provide the path to a wallpaper"; 
	else
	    wal -g -i $1 -l
	    wal_zathura
	    wal_steam -w
	    oomoxify-cli ~/.cache/wal/colors-oomox
	fi
}

# enable auto-complete of flags for colorls
source $(dirname $(gem which colorls))/tab_complete.sh
