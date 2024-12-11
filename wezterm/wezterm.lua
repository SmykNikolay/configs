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

config.initial_rows = 48
config.initial_cols = 192
--
-- config.hyperlink_rules = {
-- 	-- Matches: a URL in parens: (URL)
-- 	{
-- 		regex = "\\((\\w+://\\S+)\\)",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in brackets: [URL]
-- 	{
-- 		regex = "\\[(\\w+://\\S+)\\]",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in curly braces: {URL}
-- 	{
-- 		regex = "\\{(\\w+://\\S+)\\}",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in angle brackets: <URL>
-- 	{
-- 		regex = "<(\\w+://\\S+)>",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Then handle URLs not wrapped in brackets
-- 	{
-- 		regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
-- 		format = "$0",
-- 	},
-- 	-- implicit mailto link
-- 	{
-- 		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
-- 		format = "mailto:$0",
-- 	},
-- }
--
return config
