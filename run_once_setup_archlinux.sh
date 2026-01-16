#!/bin/bash -posix

set -e

dwnld() {
    aria2c -s16 -x16 --auto-file-renaming=false --allow-overwrite=true $1
}

setup_cursor() {
	if [ ! -d ~/.local/share/icons/Bibata-Modern-Classic ]; then
		mkdir -p ~/.local/share/icons/Bibata-Modern-Classic
		dwnld "https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz"
		tar -xvf Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons
	else
		echo Icons directory exists, cursor is likely installed. Aborted.
	fi
}

setup_themes() {
	gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
	gsettings set org.gnome.desktop.interface cursor-size 20
	gsettings set org.gnome.desktop.interface font-name "Inter 11"
	gsettings set org.gnome.desktop.interface font-rgba-order "rgb"
	gsettings set org.gnome.desktop.interface font-antialiasing "rgba"
	gsettings set org.gnome.desktop.interface font-hinting "slight"
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
	nwg-look -x
}

setup_tmux() {
	if [ ! -d ~/.config/tmux/plugins/tpm ]; then
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	else
		echo '`tpm` plugin manager already exists, skipping.'
	fi
}

sudo sh << 'EOF'
pacman -Syu aria2 git sway swaybg waybar dunst fish neovim pipewire pipewire-pulse wireplumber curl \
firefox noto-fonts noto-fonts-emoji nwg-look inter-font gcc tmux unzip eza papirus-icon-theme chezmoi \
wl-clipboard xdg-desktop-portal-gtk xdg-desktop-portal-wlr openssh ttf-jetbrains-mono-nerd \
man-db sway-contrib xorg-xwayland network-manager-applet mate-polkit chrony xz ddcutil rofi \
foot gammastep python-gobject pavucontrol which xdg-utils --noconfirm --needed
systemctl enable chronyd.service
EOF

cd /tmp
setup_cursor
setup_themes
setup_tmux
cd
