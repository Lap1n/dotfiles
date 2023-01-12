local group = vim.api.nvim_create_augroup('mapping_cmds', { clear = true })

-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

vim.keymap.set('n', '<tab>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<s-tab>', ':BufferLineCyclePrev<cr>')

-- Basic clipboard interaction
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- Delete text
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- Commands
vim.api.nvim_create_autocmd('LspAttach', {
	group = group,
	desc = 'LSP actions',
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- You can search each function in the help page.
		-- For example :help vim.lsp.buf.hover()

		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
		bufmap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
		bufmap('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
		bufmap('n', 'go', '<cmd>Telescope lsp_type_definitions<cr>')
		bufmap('n', 'gr', '<cmd>Telescope lsp_references<cr>')
		bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
		bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
		bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
		bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
		bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	end
})
local status, wk = pcall(require, "which-key")

if status then
	-- As an example, we will create the following mappings:
	--  * <leader>ff find files
	--  * <leader>fr show recent files
	--  * <leader>fb Foobar
	-- we'll document:
	--  * <leader>fn new file
	--  * <leader>fe edit file
	-- and hide <leader>1
	wk.register({
		f = {
			name = "file", -- optional group name
			f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
			--r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
			n = { "New File" }, -- just a label. don't create any mapping
			e = "Edit File", -- same as above
		},
		b = {
			name = "buffer",
			c = { "<cmd>bdelete<cr>", "Close buffer" },
			l = { "<cmd>Telescope buffers<cr>", "Switch buffers" },
		},
		w = { "<cmd>HopWord<cr>", "Hop" },
		s = {
			name = "search",
			f = { "<cmd>Telescope find_files<cr>", "Search files" },
			p = { "<cmd>Telescope find_files<cr>", "Search files" },
			t = { "<cmd>Telescope live_grep<cr>", "Search text" },
			b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
			h = { "<cmd>Telescope oldfiles<cr>", "Search recent files" },
		},
		l = {
			name = "lsp",
			d = { "<cmd>Telescope diagnostics<cr>", "List diagnotics" },
		},
	},
		{ prefix = "<leader>" }
	)
end
