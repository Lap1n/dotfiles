-- Lsp saga
local saga = require "lspsaga"
saga.init_lsp_saga {
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "<Esc>",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>"
    }
}

vim.api.nvim_exec(
    [[
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>lq <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>lq <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>

nnoremap <silent><leader>lr :Lspsaga rename<CR>

nnoremap <silent> gp :Lspsaga preview_definition<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

nnoremap <silent> <leader>lg <cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>
]],
    true
)
