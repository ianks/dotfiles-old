" Neovim specfic settings

if has('nvim') && exists(':tnoremap')
  let g:neoterm_automap_keys = ' rs'
  let g:neoterm_rspec_lib_cmd = 'spring rspec'

  nnoremap <leader>rf :TREPLSendFile<cr>
  nnoremap <leader>re :TREPLSend<cr>
  vnoremap <leader>re :TREPLSend<cr>

  " hide/close all terminals
  nnoremap <leader>rc :call neoterm#close_all()<cr>

  " kills the current job (send a <c-c>)
  nnoremap <leader>rk :call neoterm#kill()<cr>

  " run set test lib
  nnoremap <leader>ta :call neoterm#test#run('all')<cr>
  nnoremap <leader>tf :call neoterm#test#run('file')<cr>
  nnoremap <leader>tc :call neoterm#test#run('current')<cr>
  nnoremap <leader>tr :call neoterm#test#rerun()<cr>

  augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    au WinEnter term://* startinsert
  augroup END
endif
