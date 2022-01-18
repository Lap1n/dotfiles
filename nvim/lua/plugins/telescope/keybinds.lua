-- BROWSING

Keybind.register_which_key_keybinds({
  s = {
    name = "search", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
    t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search Text", noremap=false }, -- additional options for creating the keymap
    -- p={'<cmd>Telescope projects<CR>','Projects'},
  },
}, { prefix = "<leader>" })

