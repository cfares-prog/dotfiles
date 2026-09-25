# Set up the prompt

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export EDITOR="nvim"

autoload -Uz colors && colors
setopt PROMPT_SUBST

_git_prompt() {
  local branch git_status

  branch=$(git symbolic-ref --short HEAD 2>/dev/null) ||
    branch=$(git describe --tags --exact-match 2>/dev/null)

  [[ -z "$branch" ]] && return

  git_status=""
  [[ -n "$(git status --porcelain 2>/dev/null)" ]] &&
    git_status=" %F{yellow}✗%f"

  print -n " %F{green} ${branch}%f${git_status}"
}

_precmd_prompt() {
  PROMPT=" %F{green}%~%f"
  PROMPT+='$(_git_prompt)'
  PROMPT+="%F{white}❯%f "
}

precmd_functions+=( _precmd_prompt )
