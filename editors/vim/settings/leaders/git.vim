"""""""""""""""""""""""""""""""""""""""
" <leader>g
" Git mappings

nnoremap <leader>ga   :Gwrite<CR>
nnoremap <leader>gb   :Git branch<space>
nnoremap <leader>gB   :Gblame<CR>
nnoremap <leader>gbr  :Gbrowse
nnoremap <leader>gc   :Gcommit -v -q<CR>
nnoremap <leader>gco  :Git checkout<space>
nnoremap <leader>gd   :Gdiff<CR>
nnoremap <leader>gdg  :diffget<CR>
nnoremap <leader>gdp  :diffput<CR>
nnoremap <leader>ge   :Gedit<CR>
nnoremap <leader>gl   :Git log<CR>
nnoremap <leader>gm   :Gmove<space>
nnoremap <leader>gp   :Gpull<CR>
nnoremap <leader>gP   :Gpush<CR>
nnoremap <leader>gr   :Gread<CR>
nnoremap <leader>gs   :Gstatus<CR>
nnoremap <leader>gt   :Gcommit -v -q %:p<CR>
nnoremap <leader>gw   :Gwrite<CR><CR>
