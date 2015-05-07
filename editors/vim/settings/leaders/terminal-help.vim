  let g:unite_source_menu_menus.terminal = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.terminal.command_candidates = [
      \['▷ Dispatch                                          <SPC>td', 'Dispatch'],
    \['▷ Start                                             <SPC>tc', 'Start'],
    \['▷ vert new term                                     <SPC>tc', 'vert new term'],
      \]

  nnoremap <leader>th :<C-u>Unite -silent -start-insert menu:terminal<CR>
