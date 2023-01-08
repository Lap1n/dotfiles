-- See :help mason-settings
require('mason').setup({
	ui = { border = 'rounded' }
})

-- See :help mason-lspconfig-settings
require('mason-lspconfig').setup({
	ensure_installed = {
		'eslint',
		'tsserver',
		'html',
		'cssls',
		'sumneko_lua'
	}
})

-- See :help lspconfig-global-defaults
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

---
-- Diagnostic customization
---
local sign = function(opts)
	-- See :help sign_define()
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		linehl = opts.linehl,
		text = opts.text,
		--numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', linehl = "DiagnosticVirtualTextError", text = '✘' })
sign({ name = 'DiagnosticSignWarn', linehl = "DiagnosticVirtualTextWarn", text = '▲' })
sign({ name = 'DiagnosticSignHint', linehl = "DiagnosticVirtualTextHint", text = '⚑' })
sign({ name = 'DiagnosticSignInfo', linehl = "DiagnosticVirtualTextInfo", text = '' })

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

---
-- LSP servers
---
local default_handler = function(server)
	-- See :help lspconfig-setup
	lspconfig[server].setup({})
end

-- See :help mason-lspconfig-dynamic-server-setup
require('mason-lspconfig').setup_handlers({
	default_handler,
	['tsserver'] = function()
		lspconfig.tsserver.setup({
			settings = {
				completions = {
					completeFunctionCalls = true
				}
			}
		})
	end,
	['sumneko_lua'] = function()
		require('plugins.lsp.sumneko_lua')
	end
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
