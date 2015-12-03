let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

if has("gui_running")
  set t_Co=256
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
else
  let g:CSApprox_loaded = 1
endif

set background=dark
colorscheme gruvbox
