local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.freetype_load_target = 'HorizontalLcd'
config.default_prog = {'/usr/bin/fish', '-l'}

-- Jetbrains Mono
--[[ config.font = wezterm.font {
	family = 'JetBrainsMono Nerd Font',
	harfbuzz_features = { 
	'cv02', 'cv03', 'cv04', 'cv05', 'cv06', 'cv07', 'cv11',
	'cv12', 'cv17', 'cv18', 'cv20', 'cv99', 'zero'
	}
} ]]

config.font = wezterm.font {
	family = 'Maple Mono NF',
	-- harfbuzz_features = {}
}
config.font_size = 12

config.detect_password_input = false
config.enable_tab_bar = false 
config.enable_wayland = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
	top = 10,
	bottom = 10,
	left = 10,
	right = 10
}
config.keys = {
	-- Disables the default key binding for new tabs
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "t", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
}

return config
