  let g:unite_source_menu_menus.history = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.history.command_candidates = [
      \['▷ <C-u>Unite history/yank                           <SPC>hy', '<C-u>Unite history/yank'],
    \['▷ GundoToggle                                       <SPC>hu', 'GundoToggle'],
      \]

  nnoremap <leader>hh :<C-u>Unite -silent -start-insert menu:history<CR>
