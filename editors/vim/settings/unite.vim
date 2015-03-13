" Unite
" Unite and create user interfaces

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_file=$HOME.'/.vim/yankring.txt'

if executable('ag')
  let g:unite_source_rec_async_command =
        \ 'ag --line-numbers --nocolor --nogroup --hidden -g ""' .
        \ '--ignore "\.git$\|\.hg$\|\.svn$"'
endif

nnoremap <leader>t :<C-u>Unite -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>VimFiler<cr>
nnoremap <leader>y :<C-u>Unite history/yank<cr>
nnoremap <leader>b :<C-u>Unite buffer<cr>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction
