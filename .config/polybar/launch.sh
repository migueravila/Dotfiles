#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar work -c ~/.config/polybar/config.ini &
polybar sys -c ~/.config/polybar/config.ini &
