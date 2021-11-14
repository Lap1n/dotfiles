-- BROWSING

--Keybind.g({
--	-- search entered word within project
--	{ 'n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true } },
--	-- search by selected word
--	{ 'n', '<Leader>pw', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true } },
--	-- search by filename in git files
--	{ 'n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true } },
--	-- buffer list window
--	{ 'n', '<Leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true } },
--	-- search by filename in all project files
--	{ 'n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true } },
--	-- telescope through dotfiles
--	{ 'n', '<Leader>prc', [[<Cmd>lua require('plugins.telescope.settings').search_dotfiles()<CR>]], { noremap = true, silent=true } },
--	-- telescope firefox frecency
--	{ 'n', '<Leader>pc', [[<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>]], { noremap = true, silent=true } },
--})

--local wk = require("which-key")
--wk.register({
--  f = {
--    name = "file", -- optional group name
--    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
--    n = { "New File" }, -- just a label. don't create any mapping
--    e = "Edit File", -- same as above
--    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--  },
--}, { prefix = "<leader>" })
Keybind.register_which_key_keybinds({
  s = {
    name = "search", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
    t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search Text", noremap=false }, -- additional options for creating the keymap
    -- p={'<cmd>Telescope projects<CR>','Projects'},
  },
}, { prefix = "<leader>" })

-- GIT

--Keybind.g({
--	-- git branches
--	{ 'n', '<Leader>gc', [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true } },
--})
