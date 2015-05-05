"""""""""""""""""""""""""""""""""""""""
" <leader>i
" Informational mappings

" Investigate docs for method
nnoremap <leader>ii :call investigate#Investigate()<CR>

" Man pages in vertical split
nnoremap <leader>im <Plug>(Vman)

" Search Google
command! -nargs=+ Google !open "https://google.com/search?q=""<args>"
nnoremap <leader>ig :Google<Space>
