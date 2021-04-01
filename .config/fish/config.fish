# ┌─┐┬┌─┐┬ ┬
# ├┤ │└─┐├─┤
# └  ┴└─┘┴ ┴ 

### General ###
set fish_greeting
set TERM "xterm-256color"

### Colors ###
set fish_color_normal '#9ecd6f'
set fish_color_autosuggestion '#7accd7'
set fish_color_command '#9ecd6f'
set fish_color_error '#f85e84'
set fish_color_param '#7accd7'

### Aliases ###
alias l="exa -l --group-directories-first"
alias la="exa -la --group-directories-first"

alias ht=htop
alias vi=nvim
alias cat=bat

alias wt='curl wttr.in'
alias tar='tar -xf'
alias yta='youtube-dl -x -f bestaudio/best'
alias node='node'

alias p='neofetch'
alias pp='colorscript random'

alias ga='git add .'
alias gc='gitmoji -c'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'


starship init fish | source
colorscript -e crunchbang-mini