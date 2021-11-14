-- open file manager
--Keybind.g({
--	{ 'n', '<Leader>pv', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true } },
--})
local mapping ={  s = {
    p={'<cmd>Telescope projects<CR>','Projects'}
  },
}
Keybind.register_which_key_keybinds(
  mapping, { prefix = "<leader>" }
)
