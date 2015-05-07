  let g:unite_source_menu_menus.repl = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.repl.command_candidates = [
      \['▷ REPLSendLine                                      <SPC>re', 'REPLSendLine'],
    \['▷ REPLer                                            <SPC>rs', 'REPLer'],
    \['▷ Start                                             <SPC>rs', 'Start'],
      \]

  nnoremap <leader>rh :<C-u>Unite -silent -start-insert menu:repl<CR>
