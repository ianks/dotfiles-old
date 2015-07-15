" sneak.vim
" Sneak is a minimalist, versatile Vim motion plugin that jumps to any
" location specified by two characters.

let g:sneak#streak = 1
let g:sneak#prompt = '▶ '

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S
