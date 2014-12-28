function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

"grep visual selection
vnoremap K :<C-U>execute "Ag " . GetVisual()<CR>

"grep current word up to the next exclamation point using <leader>K
nnoremap <leader>K viwf!:<C-U>execute "Ag " . GetVisual()<CR>

"grep for 'def foo'
nnoremap <silent> <leader>gd :Ag 'def <cword>'<CR>

"<leader>gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap <leader>gg :Ag ""<left>

"Grep Current Partial
function! AgCurrentPartial()
  let l:fileNameWithoutExtension = expand('%:t:r')
  let l:fileNameWithoutUnderscore = substitute(l:fileNameWithoutExtension, '^_','','g')
  let l:grepPattern = "render.*[\\\'\\\"].*" . l:fileNameWithoutUnderscore . "[\\\'\\\"]$"
  exec 'Ag "' . l:grepPattern . '"'
endfunction

command! AgCurrentPartial call AgCurrentPartial()
"
nnoremap <leader>gcp :AgCurrentPartial<CR>

"Grep for usages of the current file
nnoremap <leader>gcf :exec "Ag " . expand("%:t:r")<CR>
