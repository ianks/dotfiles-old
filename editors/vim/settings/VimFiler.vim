" VimFiler
" Powerful file explorer

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = '⁞'
let g:vimfiler_tree_opened_icon = '▿'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '⭤'
let g:vimfiler_marked_file_icon = '✑'
let g:vimfiler_time_format = ""

" Allow to create and remove files
call vimfiler#custom#profile('default', 'context', {'safe' : 0})

function! s:vimfiler_settings()
  " Mimic NERDtree split behavior
  nnoremap <silent><buffer><expr> <C-x> vimfiler#do_switch_action('split')
  nnoremap <silent><buffer><expr> <C-v> vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> <C-t> vimfiler#do_switch_action('tabopen')
  inoremap <silent><buffer><expr> <C-x> vimfiler#do_switch_action('split')
  inoremap <silent><buffer><expr> <C-v> vimfiler#do_switch_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> vimfiler#do_switch_action('tabopen')
endfunction

autocmd FileType vimfiler call s:vimfiler_settings()
