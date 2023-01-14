-- See :help telescope.builtin

require('telescope').load_extension('fzf')
require"telescope".load_extension("frecency")

local actions = require "telescope.actions"

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	}
}
