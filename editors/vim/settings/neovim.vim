" Neovim specfic settings
" Most of it stolen shamelessly from @tarruda

autocmd FileType python
      \ let b:repler = executable('ipython') ? 'ipython -i %' : 'python -i %'
autocmd FileType ruby
      \ let b:repler = executable('pry') ? 'pry -r %:p' : 'irb -r %:p"'
autocmd FileType scala
      \ let b:repler = 'sbt console'
autocmd FileType javascript
      \ let b:repler = 'node'

function! s:GetVisual()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - 2]
  let lines[0] = lines[0][col1 - 1:]

  return lines
endfunction

function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

function! REPLer(cmd)
  let command = substitute(a:cmd, '%:p', expand('%:p'), 'g')
  let command = substitute(command, '%', expand('%'), 'g')

  :vnew | call termopen(command) | startinsert
endfunction

if has('nvim') && exists(':tnoremap')
  augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    au WinEnter term://* startinsert
  augroup END

  command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
  command! REPLSendLine call REPLSend([getline('.')])
  command! REPLer call REPLer(b:repler)
endif
