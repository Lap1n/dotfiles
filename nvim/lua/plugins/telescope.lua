-- See :help telescope.builtin

local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("projects")

local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		telescope_frequency = {},
	},
})
