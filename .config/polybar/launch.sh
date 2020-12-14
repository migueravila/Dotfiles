#!/usr/bin/env sh
#   ___     _      _              
#  | _ \___| |_  _| |__  __ _ _ _ 
#  |  _/ _ \ | || | '_ \/ _` | '_|
#  |_| \___/_|\_, |_.__/\__,_|_|  
#             |__/                
#  - Miguel R. Ávila


# Kill actual polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Workspaces Bar
polybar primary -c ~/.config/polybar/workspace.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar1

# Launch System bar
polybar primary -c ~/.config/polybar/system.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-mybar2
