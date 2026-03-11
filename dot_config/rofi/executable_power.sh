#!/bin/sh

CHOICE=$(printf poweroff\\nreboot\\nlogout\\nsuspend | rofi -dmenu -p ":: " -theme-str "entry {placeholder: '$(uptime -p)';} element {children: [element-text];}" -theme launcher -matching fuzzy)

case $CHOICE in
	poweroff)
		poweroff
		;;
	reboot)
		reboot
		;;
	logout)
		loginctl terminate-user ''
		;;
	suspend)
		systemctl suspend
		;;
esac
