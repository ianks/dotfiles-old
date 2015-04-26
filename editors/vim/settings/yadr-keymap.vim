" ========================================
" General vim sanity improvements
" ========================================
"
"
" Stop using ESC!
imap jk <Esc>

" Stop pressing shift all the time
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" <leader># Surround a word with #{ruby interpolation}
nmap <leader># ysiW#
vmap <leader># c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
nmap <leader>" ysiW"
vmap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
noremap <leader>' ysiW'
vmap <leader>' c'<C-R>"'<ESC>

" <leader>) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
nmap <leader>( ysiW(
nmap <leader>) ysiW)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
nmap <leader>] ysiW]
nmap <leader>[ ysiW[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
nmap <leader>} ysiW}
nmap <leader>{ ysiW{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

" <leader>` Surround a word with `backticks`
nmap <leader>` ysiW`
nmap <leader>` ysiW`
vmap <leader>` c` <C-R>" `<ESC>
vmap <leader>` c`<C-R>"`<ESC>

" Git mappings
nnoremap <leader>dg   :diffget<CR>
nnoremap <leader>dp   :diffput<CR>
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

" Open up docs for method
nnoremap <leader>K :call investigate#Investigate()<CR>

" use <leader>gf to go to file in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd F<CR>

"Go to last edit location with <leader>.
nnoremap <leader>. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-j. Example:
"
" type 'foo<c-j>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-j> will
" put the cursor right after the quote
imap <C-j> <esc>ea

" ============================
" Shortcuts for everyday tasks
" ============================

"Clear current search highlight by double tapping //
nnoremap // :nohlsearch<CR>

"(v)im (r)eload
nnoremap <leader>vr :so $MYVIMRC<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" Re-run last shell command
nnoremap <leader>rr :!!<CR>
