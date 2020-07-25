export ZSH="/home/rod/.oh-my-zsh"
ZSH_THEME="hyperzsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

#Alias

alias l="exa -1 --group-directories-first"
alias la="exa -la --group-directories-first"
alias lt="exa -T --group-directories-first"
alias lta="exa -Ta --group-directories-first"

alias fm=ranger
alias mp=mocp

alias wttr='curl -Ss "https://wttr.in?0&T&Q"'
alias wt='curl wttr.in'

alias p='pfetch'
alias pp='neofetch'

alias tb="taskbook"
alias tbt="taskbook -t"
alias tbc="taskbook -c"
alias tbcl="taskbook --clear"


