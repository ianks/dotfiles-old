" YouCompleteMe
" A code-completion engine for Vim

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 0

" Enable omnicompletion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
