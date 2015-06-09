" ========================================
" General vim sanity improvements
" ========================================
"
"
" Stop using ESC!
inoremap jk <esc>
cnoremap jk <esc>
if has('nvim')
  tnoremap jk <C-\><C-n>
endif

" Stop pressing shift all the time
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Alt mappings for next and prev buffer
nnoremap <silent><a-h> :bnext<CR>
nnoremap <silent><a-l> :bprev<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

"Go to last edit location with <leader>.

"Clear current search highlight by double tapping //
nnoremap // :nohlsearch<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-j. Example:
"
" type 'foo<c-j>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-j> will
" put the cursor right after the quote
imap <C-j> <esc>ea

if has('nvim') && exists(':tnoremap')
  " Navigating the terminals
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l
endif

" Use D to delete a range then move cursor back
com! -range D <line1>,<line2>d | norm <C-o>

