#!/bin/bash

run() {
    args=("$@")
    LOG=~/.local/share/xorg/$1.log
    ("${args[@]:1}" &> "$LOG")&
}

barfile=/tmp/polybar-$(whoami).log

until [ -f "$barfile" ]
do
     sleep 1
done

run picom /usr/bin/picom
run thunderbird /usr/bin/thunderbird
run polkit-gnome /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run xss-lock /usr/bin/xss-lock -n /usr/lib/xsecurelock/dimmer -l -- /usr/bin/xsecurelock
run geoclue /usr/lib/geoclue-2.0/demos/agent
run redshift /usr/bin/redshift-gtk
#run mpd /usr/bin/mpd
run variety /usr/bin/variety
run fcitx5 /usr/bin/fcitx5
run nextcloud /usr/bin/nextcloud
run udiskie /usr/bin/udiskie
run caffeine /usr/bin/caffeine
run cbatticon /usr/bin/cbatticon
run keepassxc /usr/bin/keepassxc
run dunst /usr/bin/dunst
run blueman /usr/bin/blueman-applet
run nm-applet /usr/bin/nm-applet
#run deskflow /usr/bin/deskflow
