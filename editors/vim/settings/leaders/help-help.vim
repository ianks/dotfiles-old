  let g:unite_source_menu_menus.help = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.help.command_candidates = [
      \['▷ <Plug>(Vman)                                      <SPC>im', '<Plug>(Vman)'],
    \['▷ Google                                            <SPC>ig', 'Google'],
    \['▷ call investigate#Investigate()                    <SPC>ii', 'call investigate#Investigate()'],
      \]

  nnoremap <leader>hh :<C-u>Unite -silent -start-insert menu:help<CR>
