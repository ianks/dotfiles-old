let g:startify_custom_header =
      \ map(split(system('fortune -s | cowsay -W 80 -w -n'), '\n'), '"   ". v:val') + ['','']
