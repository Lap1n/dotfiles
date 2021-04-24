if (has('termguicolors'))
  set termguicolors
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

function! s:_ (name, ...)
  let fg = ''
  let bg = ''
  let attr = ''

  if type(a:1) == 3
    let fg   = get(a:1, 0, '')
    let bg   = get(a:1, 1, '')
    let attr = get(a:1, 2, '')
  else
    let fg   = get(a:000, 0, '')
    let bg   = get(a:000, 1, '')
    let attr = get(a:000, 2, '')
  end

  let has_props = v:false

  let cmd = 'hi! ' . a:name
  if !empty(fg) && fg != 'none'
    let cmd .= ' guifg=' . fg
    let has_props = v:true
  end
  if !empty(bg) && bg != 'none'
    let cmd .= ' guibg=' . bg
    let has_props = v:true
  end
  if !empty(attr) && attr != 'none'
    let cmd .= ' gui=' . attr
    let has_props = v:true
  end
  execute 'hi! clear ' a:name
  if has_props
    execute cmd
  end
endfunc

call s:_('BufferInactive', '#888888', '#2B2B2B', 'none')

" highlight Normal guibg=none
" highlight NonText guibg=none
