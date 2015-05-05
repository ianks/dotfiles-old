"""""""""""""""""""""""""""""""""""""""
" <leader>b
" Buffer mappings

" Buffer explore
nnoremap <leader>be :<C-u>Unite -quick-match buffer<CR>

" Buffer next/prev
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>

" Buffer delete
nnoremap <leader>bd :bdelete<CR>
