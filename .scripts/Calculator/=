#!/usr/bin/env bash
# Based on https://github.com/sumnerevans/menu-calc
# A Dmenu Script for a quick calculator

# Dependencies: xclip, bc

usage() {
    echo "$(tput bold)DmenuCalculator$(tput sgr0)"
    echo "A Simple Calculator for Dmenu"
    echo
    echo "$(tput bold)Usage:$(tput sgr0)"
    echo "    = 4+2"
    echo "    = (4+2)/(4+3)"
    echo "    = 4^2"
    echo "    = sqrt(4)"
    echo "    = c(2)"
}

# Process CLI parameters
for var in "$@"
do
    case $var in
        -h|--help) usage ;;
        -d=*|--dmenu=*)
            menu=$(echo $var | cut -d'=' -f 2);
            ;;
        --) break ;;
    esac
done

# Grab the answer
answer=$(echo "$1" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//')

# Path to menu application
if [ ! -n "${menu+1}" ]; then
    if [[ -n $(command -v rofi) ]]; then
        menu="$(command -v rofi)"
    elif [[ -n $(command -v dmenu) ]]; then
        menu=$(command -v dmenu)
    else
        >&2 echo "Rofi or dmenu not found"
        exit
    fi
fi

# Determine args to pass to dmenu/rofi
while [[ $# -gt 0 && $1 != "--" ]]; do
    shift
done
[[ $1 == "--" ]] && shift

action=$(echo -e "Copy to clipboard\nClear\nClose" | $menu "$@" -p "= $answer")

case $action in
    "Clear") $0 "--dmenu=$menu" "--" "$@" ;;
    "Copy to clipboard") echo -n "$answer" | xclip -selection clipboard ;;
    "Close") ;;
    "") ;;
    *) $0 "$answer $action" "--dmenu=$menu" "--" "$@" ;;
esac
