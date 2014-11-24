" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <leader>nt :NERDTreeFind<CR>:vertical res 30<CR>
