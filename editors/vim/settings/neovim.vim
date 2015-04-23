" Neovim specfic settings

autocmd FileType python
      \ let b:termy = executable('ipython') ? 'ipython -i %' : 'python -i %'
autocmd FileType ruby
      \ let b:termy = executable('pry') ? 'pry -r %:p' : 'irb -r %:p"'
autocmd FileType scala
      \ let b:termy = 'sbt console'
autocmd FileType javascript
      \ let b:termy = 'node'

function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

function! Termy(cmd)
  let command = substitute(a:cmd, '%:p', expand('%:p'), 'g')
  let command = substitute(command, '%', expand('%'), 'g')

  :vnew | call termopen(command) | startinsert
endfunction

if has('nvim') && exists(':tnoremap')
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l

  augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    au WinEnter term://* startinsert
  augroup END

  nnoremap <silent> <f6> :REPLSendLine<cr>
  vnoremap <silent> <f6> :REPLSendSelection<cr>
  nnoremap <silent> <leader>r :Termy<CR>

  command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
  command! REPLSendLine call REPLSend([getline('.')])
  command! Termy call Termy(b:termy)
endif
