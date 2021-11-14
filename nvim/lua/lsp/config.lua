-- Setup lspconfig.
local on_attach = function(client, bufnr)
	--require('completion').on_attach()

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	local opts = { noremap=true, silent=false }
	buf_set_keymap('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
	buf_set_keymap('n', 'gD', '<cmd>lua require"telescope.builtin".lsp_type_definitions()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)
	--buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	Keybind.register_which_key_keybinds({
	l = {
		q = { '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', "Quick Fixes", noremap=false }, -- additional options for creating the keymap
		}
	},{ prefix = "<leader>" })

	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
			buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
			buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end
 

	-- Set autocommands conditional on server_capabilities
	-- if client.resolved_capabilities.document_highlight then
	-- 		require('lspconfig').util.nvim_multiline_command [[
	-- 		:hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
	-- 		:hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
	-- 		:hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
	-- 		augroup lsp_document_highlight
	-- 				autocmd!
	-- 				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	-- 				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	-- 		augroup END
	-- 		]]
	-- end
end


local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    local status, settings = pcall(require,'lsp.'..server.name )
		if not status then
			-- print(settings)
			settings = {}
	  end

	  opts.capabilities  = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	  opts.on_attach  = on_attach
	  opts.settings  = settings
    server:setup(opts)
end)
