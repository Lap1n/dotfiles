-- Language servers
require("configs.lsp.utils")
require("configs.lsp.clangd")
require("configs.lsp.pyright")
require("configs.lsp.tsserver")
require("configs.lsp.lua")
require("configs.lsp.omnisharp")

-- Language server plugins
--Completion plugin
require("configs.lsp.plugins.compe")
require("configs.lsp.plugins.lightbulb")
require("configs.lsp.plugins.lspfuzzy")
require("configs.lsp.plugins.lspkind")
require("configs.lsp.plugins.lspsaga")

-- local lsp_ext = require "lsp_ext"
-- lsp_ext.set_signature_help_autocmd()
