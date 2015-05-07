  let g:unite_source_menu_menus.file = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.file.command_candidates = [
      \['▷ <C-u>Unite -start-insert file_rec/async:!         <SPC>fs', '<C-u>Unite -start-insert file_rec/async:!'],
    \['▷ <C-u>VimFilerSplit -force-quit                    <SPC>fe', '<C-u>VimFilerSplit -force-quit'],
    \['▷ OpenChangedFiles                                  <SPC>fc', 'OpenChangedFiles'],
    \['▷ Unite grep:.                                      <SPC>fg', 'Unite grep:.'],
    \['▷ vertical botright wincmd F                        <SPC>fo', 'vertical botright wincmd F'],
      \]

  nnoremap <leader>fh :<C-u>Unite -silent -start-insert menu:file<CR>
