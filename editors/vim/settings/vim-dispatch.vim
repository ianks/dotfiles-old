autocmd FileType mkd
      \ let b:dispatch = 'octodown %'
autocmd FileType python
      \ let b:start = executable('ipython') ? 'ipython -i %' : 'python -i %' |
      \ let b:dispatch = 'python %'
autocmd FileType ruby
      \ let b:start = executable('pry') ? 'pry -r "%:p"' : 'irb -r "%:p"' |
      \ if expand('%') =~# '_test\.rb$' |
      \   let b:dispatch = 'testrb %' |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   let b:dispatch = 'rspec %' |
      \ elseif !exists('b:dispatch') |
      \   let b:dispatch = 'ruby -wc %' |
      \ endif
autocmd FileType java
      \ let b:dispatch = 'javac %'
autocmd FileType scala
      \ let b:start = 'sbt console' |
      \ let b:dispatch = 'sbt run'
autocmd FileType javascript
      \ let b:start = 'node' |
      \ let b:dispatch = 'grunt test'

nnoremap <silent> <leader>d :Dispatch<CR>
nnoremap <silent> <leader>s :Start<CR>
