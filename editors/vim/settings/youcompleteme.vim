" YouCompleteMe
" A code-completion engine for Vim

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 3

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'markdown': 1,
      \ 'liquid': 1
      \}

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
