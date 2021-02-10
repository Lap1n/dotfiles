local nvim_lsp = require "lspconfig"
local lsp_utils = require("configs.lsp.utils")

-- javascript and typescript
nvim_lsp.tsserver.setup {
    on_attach = lsp_utils.on_attach
}
