# oh-my-zsh core
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"

# Plugins 
plugins=(git z zsh-syntax-highlighting fast-syntax-highlighting zsh-autosuggestions fzf zsh-nvm)

# use zsh array to manage PATH without duplicates
typeset -U path
path=(
  "$HOME/.bun/bin"
  "$HOME/Library/pnpm"
  "$HOME/.local/bin"
  "$HOME/.config/tmux/bin" # include tmux-sessionizer
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $path    # include system defaults
)

export PATH

[[ -f "$HOME/.config/zsh/.env" ]] && source "$HOME/.config/zsh/.env" # load .env

tmux_sessionizer_widget() { zle -I; BUFFER='tmux-sessionizer'; zle accept-line; }

zle -N tmux_sessionizer_widget
bindkey $'\es' tmux_sessionizer_widget
bindkey -M viins $'\es' tmux_sessionizer_widget
bindkey -M vicmd $'\es' tmux_sessionizer_widget

# Jump words backwards forward in fish/bash like style
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Aliases
alias gs="git switch"
alias ga="git add"
alias gbd="git branch -d"
alias gc="git commit -m"
alias gpull="git pull"
alias gpusho="git push origin --set-upstream"
alias gpush="git push"
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias yeet="git add . && git commit -m 'wip' -n && git push --no-verify"

# Run tmux on startup
# if [ "$TMUX" = "" ]; then tmux; fi -- use it with terminal emulator only, in cursor it causes mess to show upon terminal start due to preinit functions

source ~/.config/zsh/fzf-git.sh

# load autocomplete
autoload -Uz compinit
compinit -i

source "$ZSH/oh-my-zsh.sh"
