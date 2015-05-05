"""""""""""""""""""""""""""""""""""""""
" <leader>s
" Mis mappings

" Go to last edit location
nnoremap <leader>. '.

"""""""""""""""""""""""""""""""""""""""
" <leader>s
" Surround mappings

" <leader># Surround a word with #{ruby interpolation}
nmap <leader>s# ysiW#
vmap <leader>s# c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
nmap <leader>s" ysiW"
vmap <leader>s" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
noremap <leader>s' ysiW'
vmap <leader>s' c'<C-R>"'<ESC>

" <leader>) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
nmap <leader>s( ysiW(
nmap <leader>s) ysiW)
vmap <leader>s( c( <C-R>" )<ESC>
vmap <leader>s) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
nmap <leader>s] ysiW]
nmap <leader>s[ ysiW[
vmap <leader>s[ c[ <C-R>" ]<ESC>
vmap <leader>s] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
nmap <leader>s} ysiW}
nmap <leader>s{ ysiW{
vmap <leader>s} c{ <C-R>" }<ESC>
vmap <leader>s{ c{<C-R>"}<ESC>

" <leader>` Surround a word with `backticks`
nmap <leader>s` ysiW`
nmap <leader>s` ysiW`
vmap <leader>s` c` <C-R>" `<ESC>
vmap <leader>s` c`<C-R>"`<ESC>


"""""""""""""""""""""""""""""""""""""""
" <leader>g
" Git mappings

nnoremap <leader>gdg   :diffget<CR>
nnoremap <leader>gdp   :diffput<CR>
nnoremap <leader>ga   :Git add %:p<CR><CR>
nnoremap <leader>gb   :Git branch<space>
nnoremap <leader>gbr  :Gbrowse
nnoremap <leader>gc   :Gcommit -v -q<CR>
nnoremap <leader>gd   :Gdiff<CR>
nnoremap <leader>ge   :Gedit<CR>
nnoremap <leader>gl   :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm   :Gmove<space>
nnoremap <leader>gco   :Git checkout<space>
nnoremap <leader>gpl  :Gpull<CR>
nnoremap <leader>gps  :Gpush<CR>
nnoremap <leader>gr   :Gread<CR>
nnoremap <leader>gs   :Gstatus<CR>
nnoremap <leader>gt   :Gcommit -v -q %:p<CR>
nnoremap <leader>gw   :Gwrite<CR><CR>


"""""""""""""""""""""""""""""""""""""""
" <leader>f
" File mappings

" File search
nnoremap <leader>fs :<C-u>Unite -start-insert file_rec/async:!<CR>

"File explore
nnoremap <leader>fe :<C-u>VimFilerSplit -force-quit<CR>

" Files changed
nnoremap <leader>fc :OpenChangedFiles<CR>

" File grep
nnoremap <leader>fg :Unite grep:.<CR>

" Go to file in a vertical split
nnoremap <leader>fo :vertical botright wincmd F<CR>


"""""""""""""""""""""""""""""""""""""""
" <leader>h
" History mappings

" History yank
nnoremap <leader>hy :<C-u>Unite history/yank<CR>

"History undo
nnoremap <leader>hu :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""
" <leader>b
" Buffer mappings

" Buffer explore
nnoremap <leader>be :<C-u>Unite -quick-match buffer<CR>

" Buffer next/prev
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>

" Buffer delete
nnoremap <leader>bd :bdelete<CR>


"""""""""""""""""""""""""""""""""""""""
" <leader>i
" Informational mappings

" Investigate docs for method
nnoremap <leader>ii :call investigate#Investigate()<CR>

" Man pages in vertical split
nnoremap <leader>im <Plug>(Vman)

" Search Google
command! -nargs=+ Google !open "https://google.com/search?q=""<args>"
nnoremap <leader>ig :Google<Space>


"""""""""""""""""""""""""""""""""""""""
" <leader>r
" REPL mappings

if has('nvim') && exists(':tnoremap')
  " REPL eval
  nnoremap <leader>re :REPLSendLine<CR>
  vnoremap <leader>re :REPLSendSelection<CR>

  " REPL start
  nnoremap <leader>rs :REPLer<CR>

  " Navigating the terminals
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l
else
  nnoremap <leader>rs :Start<CR>
endif


"""""""""""""""""""""""""""""""""""""""
" <leader>t
" Terminal mappings

" Terminal dispatch
nnoremap <leader>td :Dispatch<CR>

if has('nvim') && exists(':tnoremap')
  nnoremap <leader>tc :vert new term://
else
  nnoremap <leader>tc :Start<Space>
endif


"""""""""""""""""""""""""""""""""""""""
" <leader>j
" Jump mappings

" Jump to tag
nnoremap <leader>jt <C-]>
