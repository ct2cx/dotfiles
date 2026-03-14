#!/bin/bash

setup_appearance() {
	gsettings set org.gnome.desktop.interface font-rgba-order "rgb"
	gsettings set org.gnome.desktop.interface font-antialiasing "rgba"
	gsettings set org.gnome.desktop.interface font-hinting "slight"
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
	nwg-look -x
}

setup_tmux() {
	if [ ! -d ~/.config/tmux/plugins/tpm ]; then
		mkdir -p ~/.config/tmux/plugins
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	else
		echo '`tpm` plugin manager already exists, skipping.'
	fi
}

install_packages() {
	sudo pacman -S alacritty wl-clipboard git hyprland noto-fonts noto-fonts-emoji \
		unzip waybar mako network-manager-applet less man-db pcmanfm \
		rofi papirus-icon-theme fish nvim nwg-look tmux zathura \
		ttf-iosevkaterm-nerd ttf-ibmplex-mono-nerd pipewire pipewire-pulse \
		wireplumber pavucontrol brightnessctl --needed --noconfirm
}

install_packages
setup_tmux
setup_appearance
