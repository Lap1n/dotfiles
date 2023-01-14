dapui = require("dapui")
require("auto-session").setup {
	log_level = "error",
	-- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	presave_cmds = { dapui.close  }
}
