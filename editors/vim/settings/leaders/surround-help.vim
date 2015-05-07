  let g:unite_source_menu_menus.surround = {
      \ 'description' : ''
      \}

  let g:unite_source_menu_menus.surround.command_candidates = [
      \['▷ ysiW"                                             <SPC>s"', 'ysiW"'],
    \['▷ ysiW#                                             <SPC>s#', 'ysiW#'],
    \['▷ ysiW''                                             <SPC>s''', 'ysiW'''],
    \['▷ ysiW(                                             <SPC>s(', 'ysiW('],
    \['▷ ysiW)                                             <SPC>s)', 'ysiW)'],
    \['▷ ysiW[                                             <SPC>s[', 'ysiW['],
    \['▷ ysiW]                                             <SPC>s]', 'ysiW]'],
    \['▷ ysiW`                                             <SPC>s`', 'ysiW`'],
    \['▷ ysiW`                                             <SPC>s`', 'ysiW`'],
    \['▷ ysiW{                                             <SPC>s{', 'ysiW{'],
    \['▷ ysiW}                                             <SPC>s}', 'ysiW}'],
      \]

  nnoremap <leader>sh :<C-u>Unite -silent -start-insert menu:surround<CR>
