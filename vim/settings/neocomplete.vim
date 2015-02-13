" neocomplete
" Next generation completion framework.
"

if has("lua")
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_camel_case = 1
  let g:neocomplete#enable_smart_case = 1

  " Default # of completions is 100, that's crazy.
  let g:neocomplete#max_list = 100

  " Set minimum syntax keyword length.
  let g:neocomplete#auto_completion_start_length = 3

  " This makes sure we use neocomplete completefunc instead of
  " the one in rails.vim, otherwise this plugin will crap out.
  let g:neocomplete#force_overwrite_completefunc = 1

  " " Update list as you type, if neocomplete gets slow remove this
  " let g:neocomplete#enable_insert_char_pre = 1

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Better omni input patterns
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

  " Use tab to scroll through neocomplete
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " Priority ranking for snippets
  call neocomplete#custom#source('ultisnips', 'rank', 500)

  " Automatically insert delimiter
  let g:neocomplete#enable_auto_delimiter = 1

  " Fuzzy completion (wait, what was it called again?)
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete_enable_fuzzy_completion_start_length = 2

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
end
