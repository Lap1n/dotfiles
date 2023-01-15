-- See :help nvim-tree-setup
require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	hijack_cursor = false,
	on_attach = function(bufnr)
		local bufmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- :help nvim-tree.api
		local api = require("nvim-tree.api")

		bufmap("L", api.node.open.edit, "Expand folder or go to file")
		bufmap("H", api.node.navigate.parent_close, "Close parent folder")
		bufmap("gh", api.tree.toggle_hidden_filter, "Toggle hidden files")
	end,
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	pattern = "NvimTree_*",
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
			and layout[3] == nil
		then
			vim.cmd("confirm quit")
		end
	end,
})
