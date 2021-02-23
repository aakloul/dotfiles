" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup auto_format
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end

" https://github.com/RRethy/vim-illuminate
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
    " autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
    " autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
" Don't highlight word under cursor (default: 1)
" let g:Illuminate_highlightUnderCursor = 0
