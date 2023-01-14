-- See :help toggleterm-roadmap
local opts = { buffer = 0 }
local visual_mode_mapping = "<esc><esc>"
require('toggleterm').setup({
	--open_mapping = '<C-g>',
	open_mapping = '<f1>',
	direction = 'horizontal',
	shade_terminals = true,
})

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
function _G.set_terminal_keymaps()
	vim.keymap.set('t', visual_mode_mapping, [[<C-\><C-n>]], opts)
	--	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-w>l', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float",
	on_open = function()
		--vim.api.nvim_del_keymap('n', '<Esc>')
		vim.keymap.del('t', visual_mode_mapping, opts)
	end })

function _Lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })
