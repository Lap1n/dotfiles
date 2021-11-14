
Keybind.register_which_key_keybinds({
  w ={'<Plug>(easymotion-bd-w)','Move to word'}
}, { prefix = "<leader>" })


Keybind.g({
	-- take from left
	{ 'n', 's', '<Plug>(easymotion-s2)', { noremap = false, silent = true } },
})
