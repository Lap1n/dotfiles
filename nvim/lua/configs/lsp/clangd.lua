local nvim_lsp = require "lspconfig"
local lsp_utils = require("configs.lsp.utils")

require "lspconfig".clangd.setup {
    on_attach = lsp_utils.on_attach,
    cmd = {"clangd-9", "--background-index"}
}
