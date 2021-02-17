" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Comments
    Plug 'tpope/vim-commentary'
    " Change dates fast
    Plug 'tpope/vim-speeddating'
    " Convert binary, hex, etc..
    Plug 'glts/vim-radical'
    " Repeat stuff
    Plug 'tpope/vim-repeat'
    " Text Navigation
    Plug 'unblevable/quick-scope'
    " Useful for React Commenting 
    Plug 'suy/vim-context-commentstring'
    " highlight all matches under cursor
    " Plug 'RRethy/vim-illuminate'


  if exists('g:vscode')
    " Easy motion for VSCode
    Plug 'machakann/vim-highlightedyank'
    Plug 'asvetliakov/vim-easymotion'
  else
    " Sneak
    " Plug 'justinmk/vim-sneak'
    Plug 'easymotion/vim-easymotion'


    " Surround
    Plug 'tpope/vim-surround'
    " Files
    Plug 'tpope/vim-eunuch'
    " Have the file system follow you around
    " Plug 'airblade/vim-rooter'
    " auto set indent settings
    Plug 'tpope/vim-sleuth'
    " Better Syntax Support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'glepnir/zephyr-nvim'


    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'onsails/lspkind-nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'anott03/nvim-lspinstall'
    Plug 'h-michael/lsp-ext.nvim'

    "Formatting
    Plug 'sbdchd/neoformat'



    " c++ syntax highlighting
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " Status Line
    Plug 'glepnir/galaxyline.nvim'

    Plug 'kevinhwang91/rnvimr'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'

    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'

    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Start Screen
    Plug 'glepnir/dashboard-nvim'
    " Vista
    Plug 'liuchengxu/vista.vim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Zen mode
    Plug 'junegunn/goyo.vim'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    " Interactive code
    Plug 'metakirby5/codi.vim'
    " Debugging
    " Plug 'puremourning/vimspector'
    Plug 'dsych/vimspector', {'branch': 'nvim-float-window'}
    " Better tabline
    Plug 'kyazdani42/nvim-web-devicons'

    " Buffer bar
    Plug 'romgrk/barbar.nvim'
    " Plug 'mg979/vim-xtabline'
    " undo time travel
    Plug 'mbbill/undotree'
    " Find and replace
    Plug 'ChristianChiarulli/far.vim'
    " Plug 'brooth/far.vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " live server
    Plug 'turbio/bracey.vim'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " async tasks
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'idanarye/vim-omnipytent'

    " Swap windows
    Plug 'wesQ3/vim-windowswap'
    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
    " Easily Create Gists
    Plug 'mattn/vim-gist'
    Plug 'mattn/webapi-vim'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow brackets
    " Plug 'luochen1990/rainbow'
    " Async Linting Engine
    " TODO make sure to add ale config before plugin
    " Plug 'dense-analysis/ale'
    " Better Whitespace
    Plug 'ntpeters/vim-better-whitespace'
    " Multiple Cursors
    " TODO add this back in change from C-n
    " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'moll/vim-bbye'
    " Plug 'yuezk/vim-js'
    " Plug 'maxmellon/vim-jsx-pretty'
    " Plug 'jelera/vim-javascript-syntax'
    " Plugin Graveyard

    " jsx syntax support
    " Typescript syntax
    " Plug 'HerringtonDarkholme/yats.vim'
    " Multiple Cursors
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'kaicataldo/material.vim'
    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'tomasiser/vim-code-dark'
    " Vim Wiki
    " Plug 'https://github.com/vimwiki/vimwiki.git'
    " Better Comments
    " Plug 'jbgutierrez/vim-better-comments'
    " Echo doc
    " Plug 'Shougo/echodoc.vim'
    " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    " Plug 'arcticicestudio/nord-vim'
    " Ranger
    " Plug 'francoiscabrol/ranger.vim'
    " Plug 'rbgrouleff/bclose.vim'
    " Making stuff
    " Plug 'neomake/neomake'
    " Plug 'mhinz/vim-signify'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'preservim/nerdcommenter'
    " Plug 'brooth/far.vim'
    " Plug 'atishay/far.vim'
    " Semantic Highlighting for Python in Neovim
    " Plug 'numirias/semshi'
    " Debugger plugin
    " Use fzf as a search engine instead of coc builtin commands
    " Plug 'antoinemadec/coc-fzf' 
    " Telescope 
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-fzf-writer.nvim'
    " Cheat.sh
    Plug 'dbeniamine/cheat.sh-vim'
    " Omnisharp support
    Plug 'OmniSharp/omnisharp-vim'

    "Jupyter
    Plug 'GCBallesteros/jupytext.vim'
    Plug 'hkupty/iron.nvim'
    Plug 'kana/vim-textobj-user'
    Plug 'GCBallesteros/vim-textobj-hydrogen'

      
    " Org mode
     Plug 'vimwiki/vimwiki'
    "DEVELOPMENT PLUGIN
    " Neovim lua development
    Plug 'tjdevries/nlua.nvim'
    Plug 'rafcamlet/coc-nvim-lua'
    Plug 'untitled-ai/jupyter_ascending.vim'
    " Project Manager
    "v2 (in development)
    " Plug '/home/lapin/Projects/neovim/projector.nvim'
    set runtimepath^=/home/lapin/Projects/neovim/projector.nvim

  endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
