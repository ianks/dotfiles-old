" sneak.vim
" Sneak is a minimalist, versatile Vim motion plugin that jumps to any
" location specified by two characters.

let g:sneak#prompt = '▶ '

nmap f <Plug>(SneakStreak)
nmap F <Plug>(SneakStreakBackwards)
xmap f <Plug>(SneakStreak)
xmap F <Plug>(SneakStreakBackwards)
omap f <Plug>(SneakStreak)
omap F <Plug>(SneakStreakBackwards)
