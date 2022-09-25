#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

log=/tmp/polybar-$USER.log

# Launch mybar
echo "---" | tee -a $log
polybar mybar 2>&1 | tee -a $log & disown

echo "Bars launched..."
