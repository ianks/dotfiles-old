noremap <silent> <Leader>w :StripWhiteSpace<CR>

autocmd FileWritePre    * :StripWhiteSpace
autocmd FileAppendPre   * :StripWhiteSpace
autocmd FilterWritePre  * :StripWhiteSpace
autocmd BufWritePre     * :StripWhiteSpace
