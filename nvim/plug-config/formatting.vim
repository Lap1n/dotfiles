let g:neoformat_enabled_python = ['yapf']
let g:neoformat_enabled_lua = ['luafmt']
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END



let g:neoformat_enabled_cs = ['clangformat']

