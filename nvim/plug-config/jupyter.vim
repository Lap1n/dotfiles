
" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl

" nmap <leader>jx ctrih/^# %%<CR><CR>


" lua << EOF
" local iron = require('iron')

" iron.core.set_config {
  " preferred = {
    " python = "ipython"
  " }
" }
" EOF
" let g:iron_repl_open_cmd = 'vs'

let g:jupyter_ascending_python_executable = '/home/lapin/anaconda3/bin/python'
" let g:jupyter_ascending_match_pattern     = '.py'
" let g:jupyter_ascending_auto_write        = get(g:, 'jupyter_ascending_auto_write', v:true)

