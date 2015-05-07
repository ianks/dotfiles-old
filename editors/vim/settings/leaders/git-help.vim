  let g:unite_source_menu_menus.git = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.git.command_candidates = [
      \['▷ Gblame                                            <SPC>gB', 'Gblame'],
    \['▷ Gbrowse                                           <SPC>gbr', 'Gbrowse'],
    \['▷ Gcommit -v -q                                     <SPC>gc', 'Gcommit -v -q'],
    \['▷ Gcommit -v -q %:p                                 <SPC>gt', 'Gcommit -v -q %:p'],
    \['▷ Gdiff                                             <SPC>gd', 'Gdiff'],
    \['▷ Gedit                                             <SPC>ge', 'Gedit'],
    \['▷ Git add %:p<CR>                                   <SPC>ga', 'Git add %:p<CR>'],
    \['▷ Git branch                                        <SPC>gb', 'Git branch'],
    \['▷ Git checkout                                      <SPC>gco', 'Git checkout'],
    \['▷ Git log                                           <SPC>gl', 'Git log'],
    \['▷ Gmove                                             <SPC>gm', 'Gmove'],
    \['▷ Gpull                                             <SPC>gp', 'Gpull'],
    \['▷ Gpush                                             <SPC>gP', 'Gpush'],
    \['▷ Gread                                             <SPC>gr', 'Gread'],
    \['▷ Gstatus                                           <SPC>gs', 'Gstatus'],
    \['▷ Gwrite<CR>                                        <SPC>gw', 'Gwrite<CR>'],
    \['▷ diffget                                           <SPC>gdg', 'diffget'],
    \['▷ diffput                                           <SPC>gdp', 'diffput'],
      \]

  nnoremap <leader>gh :<C-u>Unite -silent -start-insert menu:git<CR>
