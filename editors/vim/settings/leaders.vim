let leaders = '~/.vim/settings/leaders'

let g:unite_source_menu_menus = {}

for fpath in split(globpath(leaders, '*.vim'), '\n')
  exe 'source' fpath
endfor
