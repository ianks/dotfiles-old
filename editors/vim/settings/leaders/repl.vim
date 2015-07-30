"""""""""""""""""""""""""""""""""""""""
" <leader>r
" REPL mappings

if has('nvim') && exists(':tnoremap')
  " Navigating the terminals
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l
else
  nnoremap <leader>rs :Start<CR>
endif
