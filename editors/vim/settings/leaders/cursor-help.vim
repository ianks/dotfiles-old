  let g:unite_source_menu_menus.cursor = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.cursor.command_candidates = [
      \['▷ UniteWithCursorWord grep:.                        <SPC>cg', 'UniteWithCursorWord grep:.'],
      \]

  nnoremap <leader>ch :<C-u>Unite -silent -start-insert menu:cursor<CR>
