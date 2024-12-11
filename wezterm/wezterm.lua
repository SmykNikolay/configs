local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.color_scheme = "Gruvbox (Gogh)"

config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
return config
