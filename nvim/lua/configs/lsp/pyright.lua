local nvim_lsp = require "lspconfig"
local lsp_utils = require("configs.lsp.utils")

--pyright config
nvim_lsp.pyright.setup {
    on_attach = lsp_utils.on_attach,
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    settings = {
        python = {
            pythonPath = "/home/lapin/anaconda3/bin/python",
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            }
        }
    }
}
