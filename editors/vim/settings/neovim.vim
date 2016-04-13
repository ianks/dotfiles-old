" Neovim specfic settings

if has('nvim')
  let g:python3_host_skip_check = 1
  let g:python_host_skip_check = 1

  augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    au WinEnter term://* startinsert
  augroup END
endif
