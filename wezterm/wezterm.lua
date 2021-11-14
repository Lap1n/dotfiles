local wezterm = require('wezterm');
return {
  exit_behavior = "Close",
  font = wezterm.font("FiraCode Nerd Font"),
  window_background_opacity =0.5,
  default_prog = {"/usr/bin/zsh"},
  font_size = 14,
  enable_scroll_bar = false,
  enable_tab_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
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
        "nvim"
  },
  window_close_confirmation = "NeverPrompt",
	force_reverse_video_cursor = true,
}
