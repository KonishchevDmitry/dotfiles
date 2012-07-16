" General settings for all developer files.


" Show line numbers
setlocal number

" Do not wrap lines
setlocal nowrap

" Don't ignore case of letters on search
setlocal noignorecase

" Show invisible characters
setlocal list listchars=tab:·\ ,trail:·


" Enable folding
setlocal foldmethod=syntax

" Default folding level for opened files
setlocal foldlevelstart=0


" Maximum width of text that is being inserted
setlocal textwidth=78

" Auto-wrap comments using textwidth
setlocal formatoptions+=c

" Do not auto-wrap text using textwidth
setlocal formatoptions-=t

" Where it makes sense, remove a comment leader when joining line
setlocal formatoptions+=j


" Highlight textwidth column
highlight TextWidthColumn ctermbg=lightgray guibg=lightgray
let w:TextWidthColumnMatch=matchadd('TextWidthColumn', '\%<80v.\%>79v', -1)
au BufWinEnter * let w:TextWidthColumnMatch=matchadd('TextWidthColumn', '\%<79v.\%>78v', -1)

" Highlight trailing whitespace
highlight TrailingWhitespace ctermbg=lightgray guibg=lightgray
let w:TrailingWhitespace=matchadd('TrailingWhitespace', '\s\+$', -1)
au BufWinEnter * let w:TrailingWhitespace=matchadd('TrailingWhitespace', '\s\+$', -1)
