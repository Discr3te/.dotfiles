# =================================================
# Prompt
# =================================================
autoload -Uz vcs_info add-zsh-hook add-zle-hook-widget
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' unstagedstr ' *'
zstyle ':vcs_info:git:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:git:*' actionformats ' %b|%a'

_cursor_hide() { print -n '\e[?25l' }
_cursor_show() { print -n '\e[?25h' }

# Blank line between commands, but not above the very first prompt
_spacer_precmd() {
  if [[ $_FIRST_PROMPT == false ]]; then
    print
  else
    _FIRST_PROMPT=false
  fi
}

_prompt_git_precmd() {
  vcs_info
  prompt_git=''
  [[ -z $vcs_info_msg_0_ ]] && return   # not in a git repo

  local dirty='' arrows=''
  local -a counts

  # '*' if anything is modified, staged, or untracked
  [[ -n $(git status --porcelain --ignore-submodules 2>/dev/null) ]] && dirty='*'

  # ⇣ behind / ⇡ ahead of upstream
  counts=($(git rev-list --left-right --count 'HEAD...@{upstream}' 2>/dev/null))
  (( ${counts[2]:-0} )) && arrows+='⇣'
  (( ${counts[1]:-0} )) && arrows+='⇡'

  prompt_git=" %F{242}${vcs_info_msg_0_}${dirty}%f"
  [[ -n $arrows ]] && prompt_git+=" %F{cyan}${arrows}%f"
}

# add-zsh-hook precmd _prompt_git_precmd 

# add-zle-hook-widget line-finish _cursor_hide  # hides cursor when enter is pressed
# add-zsh-hook preexec _cursor_show             # show cursor while a command runs
# add-zsh-hook precmd _spacer_precmd
# # add-zsh-hook precmd _cursor_hide              # seems like this line isnt needed
# add-zle-hook-widget line-init _cursor_show    # show once the prompt is drawn

PROMPT=$'%n@%m %1(j.[%j].)\n%2~ %(!.❯❯.❯) '
# PROMPT=$'%n@%m $ '
# PROMPT=$'%n@%m\n%2~ ❯'

# PROMPT=$'\n%F{blue}%~%f${prompt_git}\n%(?.%F{magenta}.%F{red})❯%f '

# =================================================
# Completion
# =================================================
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots)   # Include hidden files.

# =================================================
# History
# =================================================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY           # Appends to the file instead of overwriting it.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE        # Do not record an event starting with a space.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS        # Do not display a previously found event.

setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY       # Write to history file immediately, not just on exit.
setopt HIST_VERIFY              # Don't execute immediately upon history expansion.
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file.

# =================================================
# Shell Behaviour
# =================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # Sort file10 after file9,not after file1

# =================================================
# Alias
# =================================================
alias nvm="nvim"
alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'
alias grep='grep --color=auto'

alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias update-except='sudo pacman -Syu --ignore'
alias uninstall='sudo pacman -Rns'
alias search='pacman -Ss'
alias cleanup='sudo pacman -Sc'
