au FileType mkd setlocal spell linebreak nolist

let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html','bash=sh', 'sh', 'python']

function! s:TableFormat()
    let l:pos = getpos('.')
    normal! {
    " Search instead of `normal! j` because of the table at beginning of file edge case.
    call search('|')
    normal! j
    " Remove everything that is not a pipe othewise well formated tables would grow
    " because of addition of 2 spaces on the separator line by Tabularize /|.
    s/[^|]//g
    Tabularize /|
    s/ /-/g
    call setpos('.', l:pos)
endfunction

command! -buffer TableFormat call s:TableFormat()
