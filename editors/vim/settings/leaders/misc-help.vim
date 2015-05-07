  let g:unite_source_menu_menus.misc = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.misc.command_candidates = [
      \['▷ ''.                                                <SPC>.', '''.'],
      \]

  nnoremap <leader>mh :<C-u>Unite -silent -start-insert menu:misc<CR>
