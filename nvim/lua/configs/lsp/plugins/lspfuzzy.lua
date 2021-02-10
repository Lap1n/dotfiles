-- LSP fuzzy
require("lspfuzzy").setup {}
vim.api.nvim_exec(
    [[
nnoremap <silent> <leader>ldd :LspDiagnostics 0<CR>
nnoremap <silent> <leader>lda :LspDiagnosticsAll<CR>
]],
    true
)
