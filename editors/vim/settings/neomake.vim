autocmd! BufWritePost * Neomake

if executable('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
else
  echoe 'No eslint executable detected. Install eslint for Javascript syntax higlighting. `npm install -g eslint`'
endif

if executable('rubocop')
  let g:neomake_ruby_enabled_makers = ['rubocop']
else
  echoe 'No eslint executable detected. Install eslint for Javascript syntax higlighting. `npm install -g eslint`'
endif
