local nvim_lsp = require "lspconfig"

--pyright config
nvim_lsp.pyright.setup {
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
