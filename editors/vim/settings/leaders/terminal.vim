"""""""""""""""""""""""""""""""""""""""
" <leader>t
" Terminal mappings

" Terminal dispatch
nnoremap <leader>td :Dispatch<CR>

if has('nvim') && exists(':tnoremap')
  nnoremap <leader>tc :vert new term://
else
  nnoremap <leader>tc :Start<Space>
endif
