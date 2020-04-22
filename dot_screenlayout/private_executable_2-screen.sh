#!/bin/sh
xrandr --output eDP1 --mode 1366x768 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
xrandr --output eDP1 --off
pkill polybar
herbstclient set_monitors 1920x1080+0+0
polybar default&
variety -n
