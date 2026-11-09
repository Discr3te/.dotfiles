# =================================================
# Colors
# =================================================
typeset -gA _c=(
  red '#f7768e'
  blue '#7aa2f7'
  light_blue '#7dcfff'
  grey '#828bb8'
  yellow '#e0af68'
  magenta '#bb9af7'
  green '#9ece6a'
)

[[ $COLORTERM == (24bit|truecolor) ]] || zmodload zsh/nearcolor

# =================================================
# Prompt
# =================================================
autoload -Uz vcs_info add-zsh-hook add-zle-hook-widget
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:git:*' actionformats ' %b|%a'

_prompt_git_precmd() {
  prompt_git=''
  vcs_info
  [[ -z $vcs_info_msg_0_ ]] && return

  local line
  local -a ab
  local -i ahead behind
  local ab_symbol
  local untracked_symbol staged_symbol unstaged_symbol
  for line in ${(f)"$(git --no-optional-locks status --porcelain=v2 --branch 2>/dev/null)"}; do
    case $line in
    '# branch.ab '*)
      ab=(${=line#'# branch.ab '})
      ahead=${ab[1]#+}
      behind=${ab[2]#-}

      if ((ahead && behind)); then
        ab_symbol=''
      elif ((behind)); then
        ab_symbol=''
      elif ((ahead)); then
        ab_symbol=''
      fi
      ;;
    '? '*)
      untracked_symbol='?'
      ;;
    [12u]' '*) # changed / renamed / unmerged: "1 XY ..."
      [[ ${line[3]} != . ]] && staged_symbol='+'
      [[ ${line[4]} != . ]] && unstaged_symbol='*'
      ;;
    esac
  done

  local git_color=${_c[green]}
  local status_symbols=$staged_symbol$unstaged_symbol$untracked_symbol
  [[ -n $ab_symbol$untracked_symbol$status_symbols ]] && git_color=${_c[yellow]}

  # %% so a branch name containing % can't inject prompt escapes.
  prompt_git="%F{$git_color} ${vcs_info_msg_0_//\%/%%}$status_symbols%f"
  [[ -n $ab_symbol ]] && prompt_git+="%F{${_c[light_blue]}} $ab_symbol%f"
}

typeset -gi _spacer_skip=1 # 1 = no blank line before the next prompt

_spacer() {
  ((_spacer_skip)) || print
  _spacer_skip=0
}

function clear {
  if [[ $@ =~ '(^| )-V( |$)' ]]; then
    _spacer_skip=0
  else
    _spacer_skip=1
  fi

  command clear "$@"
}
function reset { command reset "$@" && _spacer_skip=1; }

_cursor_show() { print -n '\e[?25h'; }
_cursor_hide() { print -n '\e[?25l'; }

add-zle-hook-widget line-finish _cursor_hide
add-zle-hook-widget line-init _cursor_show
add-zsh-hook preexec _cursor_show

add-zsh-hook precmd _cursor_hide
add-zsh-hook precmd _prompt_git_precmd
add-zsh-hook precmd _spacer

PROMPT=$'%F{${_c[grey]}}%n@%m%f %1(j.%F{${_c[yellow]}}[%F{${_c[grey]}}%j%F{${_c[yellow]}}]%f.)\n'
PROMPT+=$'%F{${_c[blue]}}%2~%f${prompt_git} %(?.%F{${_c[magenta]}}.%F{${_c[red]})%(!.❯❯.❯)%f '

# =================================================
# Completion
# =================================================
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# =================================================
# History
# =================================================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY         # Appends to the file instead of overwriting it.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.

setopt EXTENDED_HISTORY     # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY   # Write to history file immediately, not just on exit.
setopt HIST_VERIFY          # Don't execute immediately upon history expansion.
setopt HIST_IGNORE_ALL_DUPS # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS    # Do not write a duplicate event to the history file.

# =================================================
# Shell Behaviour
# =================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # Sort file10 after file9,not after file1

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
