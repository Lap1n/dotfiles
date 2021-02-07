
" let g:startify_custom_header = [
        " \ '        _   ___    ________          __   ',
        " \ '       / | / / |  / / ____/___  ____/ /__ ',
        " \ '      /  |/ /| | / / /   / __ \/ __  / _ \',
        " \ '     / /|  / | |/ / /___/ /_/ / /_/ /  __/',
        " \ '    /_/ |_/  |___/\____/\____/\__,_/\___/ ',
        " \]

" let g:startify_session_dir = '~/.config/nvim/session'


" let g:startify_lists = [
          " \ { 'type': 'files',     'header': ['   Files']                        },
          " \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          " \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          " \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          " \ ]


" let g:startify_session_autoload = 1
" let g:startify_session_delete_buffers = 1
" let g:startify_change_to_vcs_root = 1
" let g:startify_fortune_use_unicode = 1
" let g:startify_session_persistence = 1

" let g:webdevicons_enable_startify = 1

" function! StartifyEntryFormat()
        " return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    " endfunction

" let g:startify_bookmarks = [
            " \ { 'i': '~/.config/nvim/init.vim' },
            " \ { 'c': '~/.config/i3/config' },
            " \ { 'z': '~/.zshrc' },
            " \ ]
let g:dashboard_default_executive ='fzf'
let g:dashboard_session_directory = '/home/lapin/.cache/nvim/session'

let s:dashboard_shortcut={}
let s:dashboard_shortcut_icon={}
let s:dashboard_shortcut['last_session'] = 'SPC s l'
let s:dashboard_shortcut['find_history'] = 'SPC s h'
let s:dashboard_shortcut['find_file'] = 'SPC f f'
let s:dashboard_shortcut['new_file'] = 'SPC c n'
let s:dashboard_shortcut['change_colorscheme'] = 'SPC t c'
let s:dashboard_shortcut['find_word'] = 'SPC f a'
let s:dashboard_shortcut['book_marks'] = 'SPC f b'
let s:dashboard_shortcut['projects'] = 'SPC p s'

let s:dashboard_shortcut_icon['last_session'] = ' '
let s:dashboard_shortcut_icon['find_history'] = ' '
let s:dashboard_shortcut_icon['find_file'] = ' '
let s:dashboard_shortcut_icon['new_file'] = ' '
let s:dashboard_shortcut_icon['change_colorscheme'] = ' '
let s:dashboard_shortcut_icon['find_word'] = ' '
let s:dashboard_shortcut_icon['book_marks'] = ' '
let s:dashboard_shortcut_icon['projects'] = ' '

let g:dashboard_custom_section={
    \ 'last_session'         :{
          \ 'description': [s:dashboard_shortcut_icon['last_session'].'Open last session                     '.s:dashboard_shortcut['last_session']],
          \ 'command':function('dashboard#handler#last_session')},
    \ 'find_history'         :{
          \ 'description': [s:dashboard_shortcut_icon['find_history'].'Recently opened files                 '.s:dashboard_shortcut['find_history']],
          \ 'command':function('dashboard#handler#find_history')},
    \ 'find_file'            :{
          \ 'description': [s:dashboard_shortcut_icon['find_file'].'Find file                             '.s:dashboard_shortcut['find_file']],
          \ 'command':function('dashboard#handler#find_file')},
    \ 'new_file'             :{
          \ 'description': [s:dashboard_shortcut_icon['new_file'].'New file                              '.s:dashboard_shortcut['new_file']],
          \ 'command':function('dashboard#handler#new_file')},
    \ 'change_colorscheme'   :{
          \ 'description': [s:dashboard_shortcut_icon['change_colorscheme'].'Change colorscheme                    '.s:dashboard_shortcut['change_colorscheme']],
          \ 'command':function('dashboard#handler#change_colorscheme')},
    \ 'find_word'            :{
          \ 'description': [s:dashboard_shortcut_icon['find_word'].'Find word                             '.s:dashboard_shortcut['find_word']],
          \ 'command': function('dashboard#handler#find_word')},
    \ 'book_marks'           :{
          \ 'description': [s:dashboard_shortcut_icon['book_marks'].'Jump to bookmarks                     '.s:dashboard_shortcut['book_marks']],
          \ 'command':function('dashboard#handler#book_marks')},
  \ 'project_list': {
    \ 'description': [s:dashboard_shortcut_icon['projects'].'List projects                         '.s:dashboard_shortcut['projects']],
      \ 'command': 'CocList projects' }
  \ }
