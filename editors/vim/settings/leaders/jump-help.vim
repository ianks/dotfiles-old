  let g:unite_source_menu_menus.jump = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.jump.command_candidates = [
      \['▷ <C-]>                                             <SPC>jt', '<C-]>'],
      \]

  nnoremap <leader>jh :<C-u>Unite -silent -start-insert menu:jump<CR>
