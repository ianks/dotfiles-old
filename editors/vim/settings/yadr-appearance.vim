" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
  " set lines=60
  " set columns=190
else
  let g:CSApprox_loaded = 1
endif

set background=dark

" Colorscheme
let g:seoul256_background = 235
colo seoul256
