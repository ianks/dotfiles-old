set suffixesadd+=.ts
set suffixesadd+=.tsx

autocmd FileType typescript nmap <buffer> <Leader>cr <Plug>(TsuquyomiRenameSymbolC)
