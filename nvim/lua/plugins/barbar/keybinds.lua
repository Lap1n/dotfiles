local mapping = {
	b = {
		name = "buffers", -- optional group name
		d = { "<cmd>:BufferClose<CR>", "Close Current Buffer" },
		c = { "<cmd>:BufferCloseAllButCurrent<CR>", "Close All But Current" },
		a = { "<cmd>:BufferWipeout<CR>", "Close All Buffers" },
	},
}

Keybind.g({
	-- take from left
	{ "n", "<tab>", "<cmd>:BufferNext<CR>", { noremap = false, silent = true } },
	{ "n", "<s-tab>", "<cmd>:BufferPrevious<CR>", { noremap = false, silent = true } },
})
Keybind.register_which_key_keybinds(mapping, { prefix = "<leader>" })
