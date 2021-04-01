#!/usr/bin/env bash

DIR="$HOME/.config/polybar/widgets"

launcher() {
	rofi -no-config -no-lazy-grab -show drun -modi drun -theme "$DIR"/launcher.rasi
}

theme = "budgie"
launcher


