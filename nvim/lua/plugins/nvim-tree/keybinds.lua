-- open file manager
--Keybind.g({
--	{ 'n', '<Leader>pv', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true } },
--})
mapping = {
  e ={'<Cmd>NvimTreeToggle<CR>','Open Explorer'}
}
Keybind.register_which_key_keybinds(
  mapping, { prefix = "<leader>" }
)
