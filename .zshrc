
# Allow for color
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit && compinit
zmodload zsh/complist

_comp_options+=(globdots)   # Include hidden files.

# Alias
alias nvm="nvim"

