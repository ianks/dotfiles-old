  let g:unite_source_menu_menus.buffer = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.buffer.command_candidates = [
      \['▷ <C-u>Unite -quick-match buffer                    <SPC>be', '<C-u>Unite -quick-match buffer'],
    \['▷ bdelete                                           <SPC>bd', 'bdelete'],
    \['▷ bnext                                             <SPC>bn', 'bnext'],
    \['▷ bprev                                             <SPC>bp', 'bprev'],
      \]

  nnoremap <leader>bh :<C-u>Unite -silent -start-insert menu:buffer<CR>
