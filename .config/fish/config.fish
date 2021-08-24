# ┌─┐┬┌─┐┬ ┬
# ├┤ │└─┐├─┤
# └  ┴└─┘┴ ┴ 

### General ###
set fish_greeting
set TERM "xterm-256color"

### Colors ###
set fish_color_normal '#9ccfd8'
set fish_color_autosuggestion '#f6c177'
set fish_color_command '#9ccfd8'
set fish_color_error '#eb6f92'
set fish_color_param '#f6c177'

### Aliases ###

# ls
alias l="exa -l --group-directories-first"
alias la="exa -la --group-directories-first"

# tools
alias h='htop'
alias v='nvim'
alias c='bat'
alias f='ranger'

# git
alias ga='git add .'
alias gc='gitmoji -c'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'

# helpers
alias smk='sudo make install'
alias wt='curl wttr.in'
alias tar='tar -xf'
alias yta='youtube-dl -x -f bestaudio/best'

# playground
alias p='neofetch'
alias pp='colorscript random'

# prompt
starship init fish | source
colorscript -e alpha