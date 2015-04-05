" fugitive.git
" ========================================

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
nnoremap <leader>go   :Git checkout<space>
nnoremap <leader>gpl  :Gpull<CR>
nnoremap <leader>gps  :Gpush<CR>
nnoremap <leader>gr   :Gread<CR>
nnoremap <leader>gs   :Gstatus<CR>
nnoremap <leader>gt   :Gcommit -v -q %:p<CR>
nnoremap <leader>gw   :Gwrite<CR><CR>
