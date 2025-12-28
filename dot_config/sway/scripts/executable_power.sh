#!/bin/bash

poweroff="󰤆"
reboot=""
logout="󰍃"

cmd=$(printf "$logout\n$poweroff\n$reboot" | \
	rofi -dmenu -theme ~/.config/rofi/simple/powermenu.rasi -mesg "$(uptime -p)")

case "$cmd" in
    $poweroff)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $logout)
        loginctl terminate-session $XDG_SESSION_ID
        ;;
esac
