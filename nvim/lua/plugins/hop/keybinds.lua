
Keybind.register_which_key_keybinds({
  w ={'<cmd>HopWord<CR>','Move to word'}
}, { prefix = "<leader>" })


Keybind.g({
	-- take from left
	{ 'n', 's', '<cmd>HopChar2<CR>', { noremap = false, silent = true } },
	-- { 'n', '/', '<cmd>HopPattern<CR>', { noremap = false, silent = true } },
})

