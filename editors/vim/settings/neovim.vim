" Neovim specfic settings

if has('nvim') && exists(':tnoremap')
  augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    au WinEnter term://* startinsert
  augroup END
endif
