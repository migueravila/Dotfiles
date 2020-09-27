#!/usr/bin/env sh
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar primary -c ~/.config/polybar/workspace.ini &
polybar primary -c ~/.config/polybar/system.ini &
