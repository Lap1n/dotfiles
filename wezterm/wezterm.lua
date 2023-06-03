local wezterm = require("wezterm")
return {
	color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
	exit_behavior = "Close",
	font = wezterm.font("FiraCode Nerd Font"),
	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "VictorMono Nerd Font",
				weight = "Bold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({
				family = "VictorMono Nerd Font",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "VictorMono Nerd Font",
				style = "Italic",
			}),
		},
	},
	--font = wezterm.font("VictorMono Nerd Font", { italic = true }),
	window_background_opacity = 0.5,
	-- text_background_opacity =0.0,
	--default_prog = { "/usr/bin/zsh" },
	font_size = 15,
	-- font_size = 16,
	enable_scroll_bar = false,
	enable_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = { { key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b[13;2u" }) } },
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"cmd.exe",
		"pwsh.exe",
		"powershell.exe",
		"nvim",
	},
	window_close_confirmation = "NeverPrompt",
	force_reverse_video_cursor = true,
	colors = {
		-- The default background color
		background = "black",
	},
	window_decorations = "RESIZE",
}
