"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/quickscope.vim

source $HOME/.config/nvim/plug-config/easymotion.vim
if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
  " set timeoutlen=0                      " By default timeoutlen is 1000 ms
  source $HOME/.config/nvim/plug-config/highlightyank.vim
else
  " g Leader key
  let mapleader=" "
  " let localleader=" "
  nnoremap <Space> <Nop>
  set clipboard=unnamedplus               " Copy paste between vim and everything else
  " Themes
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/material.vim
  " source $HOME/.config/nvim/themes/zephyr.vim
  luafile $HOME/.config/nvim/themes/galaxyline/evilline.lua


  " Plugin Configuration
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  " source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  " source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/vim-wiki.vim
  " source $HOME/.config/nvim/plug-config/coc.vim
  luafile $HOME/.config/nvim/lua/configs/init.lua
  source $HOME/.config/nvim/plug-config/formatting.vim
  source $HOME/.config/nvim/plug-config/goyo.vim
  source $HOME/.config/nvim/plug-config/vim-rooter.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/vista.vim
  source $HOME/.config/nvim/plug-config/tabline.vim
  source $HOME/.config/nvim/plug-config/far.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
  " source $HOME/.config/nvim/plug-config/illuminate.vim
  source $HOME/.config/nvim/plug-config/bracey.vim
  source $HOME/.config/nvim/plug-config/asynctask.vim
  source $HOME/.config/nvim/plug-config/omnipytent.vim
  source $HOME/.config/nvim/plug-config/window-swap.vim
  " source $HOME/.config/nvim/plug-config/markdown-preview.vim
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  luafile $HOME/.config/nvim/plug-config/telescope.lua
  luafile $HOME/.config/nvim/plug-config/tree-sitter.lua
  source $HOME/.config/nvim/plug-config/vimspector.vim " Uncomment if you want to use Vimspector
  source $HOME/.config/nvim/plug-config/sessions.vim " Uncomment if you want to use Vimspector
  source $HOME/.config/nvim/plug-config/jupyter.vim 
  source $HOME/.config/nvim/plug-config/nvim-tree.vim
  source $HOME/.config/nvim/plug-config/vsnip.vim
  " source $HOME/.config/nvim/plug-config/completion.vim

  " Add paths to node and python here
  if !empty(glob("~/.config/nvim/paths.vim"))
    source $HOME/.config/nvim/paths.vim
  endif

  " Better nav for omnicomplete TODO figure out why this is being overridden
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  " Fix the parenthese cursor on parenthesis
  hi MatchParen cterm=bold ctermfg=220 gui=bold guifg=#ffcc00 guibg=#263238
  if (has('termguicolors'))
  " Enable true color
    set termguicolors " enable true colors support
  endif     

  " Plug[Vimspector] config
  let g:vimspector_enable_mappings = 'HUMAN'

  " Reloads vimrc after saving but keep cursor position
  if !exists('*ReloadVimrc')
     fun! ReloadVimrc()
         let save_cursor = getcurpos()
         source $MYVIMRC
         call setpos('.', save_cursor)
     endfun
  endif
  autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

  function! GoToColumnInFile (fileInfoString)
    let fileInfo = split(a:fileInfoString, ":")
    let column = 0
    normal! gF
    if len(fileInfo) > 2
      let column = fileInfo[2]
      execute 'normal! ' . column . '|'
    endif
  endfunction
  nmap gf <c-w>gF

  let g:OmniSharp_highlighting = 0

  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
endif




