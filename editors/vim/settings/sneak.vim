" sneak.vim
" Sneak is a minimalist, versatile Vim motion plugin that jumps to any
" location specified by two characters.

let g:sneak#prompt = '▶ '

nmap f <Plug>(SneakStreak)
nmap F <Plug>(SneakStreakBackward)
xmap f <Plug>(SneakStreak)
xmap F <Plug>(SneakStreakBackward)
omap f <Plug>(SneakStreak)
omap F <Plug>(SneakStreakBackward)
