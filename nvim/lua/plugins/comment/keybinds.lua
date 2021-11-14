
Keybind.register_which_key_keybinds({
	["/"] = { '<cmd>lua require("Comment.comment").toggle()<CR>', 'Comment' }, -- create a binding with label
}, { prefix = "<leader>" ,mode='n'})

Keybind.register_which_key_keybinds({
    ["/"] = { "<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>", "Comment" },
}, { prefix = "<leader>" ,mode='v'})
