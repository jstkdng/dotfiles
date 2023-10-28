#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

log=/tmp/polybar-$USER.log
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch mybar
MONITOR=$PRIMARY polybar mybar 2>&1 | tee -a "$log" & disown
sleep 1

for m in $OTHERS; do
    MONITOR=$m polybar mybar 2>&1 | tee -a "$log" & disown
done
