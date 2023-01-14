require("neodev").setup({
	library = { plugins = true, types = true },
})
require("neoconf").setup({
	-- override any of the default settings here
})
-- See :help mason-settings
require("mason").setup({
	ui = { border = "rounded" },
})

-- See :help mason-lspconfig-settings
require("mason-lspconfig").setup({
	ensure_installed = {
		"eslint",
		"tsserver",
		"html",
		"cssls",
		"sumneko_lua",
		"pyright",
		"jsonls",
	},
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
require("persistent-breakpoints").setup({
	load_breakpoints_event = { "BufReadPost" },
})
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
})

--require 'mason-nvim-dap'.setup_handlers {}
-- require 'mason-nvim-dap'.setup_handlers {
--     function(source_name)
--       -- all sources with no handler get passed here
--
--
--       -- Keep original functionality of `automatic_setup = true`
--       require('mason-nvim-dap.automatic_setup')(source_name)
--     end,
--     python = function(source_name)
--         dap.adapters.python = {
-- 	        type = "executable",
-- 	        command = "/usr/bin/python3",
-- 	        args = {
-- 		        "-m",
-- 		        "debugpy.adapter",
-- 	        },
--         }
--
--         dap.configurations.python = {
-- 	        {
-- 		        type = "python",
-- 		        request = "launch",
-- 		        name = "Launch file",
-- 		        program = "${file}", -- This configuration will launch the current file if used.
-- 	        },
--         }
--     end,
-- }
--
--

-- See :help lspconfig-global-defaults
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

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

sign({ name = "DiagnosticSignError", linehl = "DiagnosticVirtualTextError", text = "✘" })
sign({ name = "DiagnosticSignWarn", linehl = "DiagnosticVirtualTextWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", linehl = "DiagnosticVirtualTextHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", linehl = "DiagnosticVirtualTextInfo", text = "" })

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

---
-- LSP servers
---
local default_handler = function(server)
	-- See :help lspconfig-setup
	lspconfig[server].setup({})
end

-- See :help mason-lspconfig-dynamic-server-setup
require("mason-lspconfig").setup_handlers({
	default_handler,
	["tsserver"] = function()
		lspconfig.tsserver.setup({
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})
	end,
	["sumneko_lua"] = function()
		require("plugins.lsp.sumneko_lua")
	end,
})
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
