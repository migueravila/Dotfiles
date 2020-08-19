# _   _               _  __ _ _           
#| \ | |             | |/ _(_) |          
#|  \| | ___  _ __ __| | |_ _| | ___  ___ 
#| . ` |/ _ \| '__/ _` |  _| | |/ _ \/ __|
#| |\  | (_) | | | (_| | | | | |  __/\__ \
#\_| \_/\___/|_|  \__,_|_| |_|_|\___||___/
                                                          
export ZSH="/home/rod/.oh-my-zsh"
ZSH_THEME="hyperzsh"

export EDITOR=nvim
export VISUAL=nvim
export TERM=st-256color

export HISTCONTROL=ignoreboth
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=100

#Plugins

plugins=(
  zsh-syntax-highlighting
  jovial
)
source $ZSH/oh-my-zsh.sh

#Alias 
alias l="exa -l --group-directories-first"
alias la="exa -la --group-directories-first"

alias fm='~/.config/vifm/scripts/vifmrun'
alias mp=ncmpcpp
alias ht=htop
alias vi=nvim

alias wt='curl wttr.in'
alias tar='tar -xf'

alias p='ffetch'

alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
