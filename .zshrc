
# Allow for color
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit && compinit
zmodload zsh/complist

_comp_options+=(globdots)   # Include hidden files.

# Alias
alias nvm="nvim"
alias track="defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true"
alias mouse="defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false"

