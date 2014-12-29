"Grep for usages of the current file
nnoremap <leader>gcf :exec "Ag " . expand("%:t:r")<CR>
