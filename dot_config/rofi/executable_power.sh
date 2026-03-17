#!/bin/sh

CHOICE=$(printf 󰐥\\n\\n󰗽\\n󰏨| \
	rofi -dmenu -theme powermenu -matching fuzzy \
	-theme-str "textbox-uptime { content: '$(uptime -p)';}")

case $CHOICE in
	󰐥)
		poweroff
		;;
	)
		reboot
		;;
	󰗽)
		loginctl terminate-user ''
		;;
	󰏨)
		systemctl suspend
		;;
esac
