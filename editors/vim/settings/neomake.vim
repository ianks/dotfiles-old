let s:enabled_options = [
      \ 'target', 'emitDecoratorMetadata', 'experimentalDecorators',
      \ 'module', 'noImplicitAny', 'rootDir', 'noEmit', 'jsx'
      \]

function! neomake#makers#ft#typescript#tsc()
  let l:tsconfig = findfile('tsconfig.json', '.;')
  if len(l:tsconfig)
    let true = 1
    let false = 0
    let null = 0
    " ugly shortcut
    let l:jsonText = join(readfile(l:tsconfig, 'b'), '')
    let l:json = eval(l:jsonText)
    let l:option = get(l:json, 'compilerOptions', {})
    let l:option['noEmit'] = 1
    let l:args = []
    if !len(get(l:option, 'rootDir', ''))
      let l:option['rootDir'] = fnamemodify(l:tsconfig, ':h')
    endif
    for [key, value] in items(l:option)
      if index(s:enabled_options, key) == -1
        continue
      endif
      if value == 1
        call insert(l:args, '--'.key)
      elseif type(value) == type('')
        call insert(l:args, value)
        call insert(l:args, '--'.key)
      endif
    endfor
  else
    let l:args = [
          \ '-m', 'commonjs', '--noEmit', '--rootDir', '.'
          \ ]
  endif

  return {
        \ 'args': l:args,
        \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
        \ }
endfunction

function! neomake#makers#ft#tsx#tsc()
  let l:tsconfig = findfile('tsconfig.json', '.;')
  if len(l:tsconfig)
    let true = 1
    let false = 0
    let null = 0
    " ugly shortcut
    let l:jsonText = join(readfile(l:tsconfig, 'b'), '')
    let l:json = eval(l:jsonText)
    let l:option = get(l:json, 'compilerOptions', {})
    let l:option['noEmit'] = 1
    let l:args = []
    if !len(get(l:option, 'rootDir', ''))
      let l:option['rootDir'] = fnamemodify(l:tsconfig, ':h')
    endif
    for [key, value] in items(l:option)
      if index(s:enabled_options, key) == -1
        continue
      endif
      if value == 1
        call insert(l:args, '--'.key)
      elseif type(value) == type('')
        call insert(l:args, value)
        call insert(l:args, '--'.key)
      endif
    endfor
  else
    let l:args = [
          \ '-m', 'commonjs', '--noEmit', '--rootDir', '.'
          \ ]
  endif

  return {
        \ 'args': l:args,
        \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
        \ }
endfunction

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_tsx_enabled_makers = ['tsc', 'tslint']

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

let g:neomake_open_list = 1

autocmd! BufWritePost * Neomake
