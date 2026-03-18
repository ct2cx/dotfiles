#!/bin/bash

# initialize
APPS=$(ls --color=never ~/.var/app 2> /dev/null)
for folder in ${APPS[@]}; do
	mkdir ~/.var/app/$folder/config/fontconfig
	cp ~/.config/fontconfig/fonts.conf ~/.var/app/$folder/config/fontconfig
done

# monitor
inotifywait -m -e create -q ~/.var/app | 
	while read dir events name; do
		case "$events" in
			*ISDIR*)
				mkdir -p ~/.var/app/$name/config/fontconfig
				cp ~/.config/fontconfig/fonts.conf ~/.var/app/$name/config/fontconfig
				;;
		esac
	done
