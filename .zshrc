export ZSH="/home/rod/.oh-my-zsh"
ZSH_THEME="hyperzsh"
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim' export VISUAL='nvim'

#Alias

alias l="exa -1 --group-directories-first"
alias la="exa -la --group-directories-first"
alias lt="exa -T --group-directories-first"
alias lta="exa -Ta --group-directories-first"

alias fm=ranger
alias mp=mocp
alias ht=htop
alias vi=nvim

alias wttr='curl -Ss "https://wttr.in?0&T&Q"'
alias wt='curl wttr.in'

alias p='afetch'
alias pp='neofetch'

alias tb="taskbook"
alias tbt="taskbook -t"
alias tbc="taskbook -c"
alias tbcl="taskbook --clear"

alias ga='git add .'
alias gs='git satus'
alias gc='git commit -m'
alias gpl='git pull'
alias gp='git push'

#Scripts

colorscript random
