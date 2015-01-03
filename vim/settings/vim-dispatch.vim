autocmd FileType python
      \ let b:dispatch = 'python %'
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   let b:dispatch = 'testrb %' |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   let b:dispatch = 'rspec %' |
      \ elseif !exists('b:dispatch') |
      \   let b:dispatch = 'ruby -wc %' |
      \ endif

nnoremap <silent> <leader>d :Dispatch<CR>
