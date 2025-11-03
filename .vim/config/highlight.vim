" Highlight textwidth column

function HighlightTextWidthColumn()
    hi TextWidthColumn ctermbg=lightgray guibg=lightgray

    if !exists('w:TextWidthColumnMatch')
        let w:TextWidthColumnMatch = matchadd('TextWidthColumn', '\%<122v.\%>121v', -1)
    endif
endfunction

au BufWinEnter * call HighlightTextWidthColumn()
call HighlightTextWidthColumn()


" Highlight trailing whitespace

function HighlightTrailingWhitespace()
    hi TrailingWhitespace ctermbg=lightgray guibg=lightgray

    if !exists('w:TrailingWhitespace')
        let w:TrailingWhitespace = matchadd('TrailingWhitespace', '\s\+$', -1)
    endif
endfunction

au BufWinEnter * call HighlightTrailingWhitespace()
call HighlightTrailingWhitespace()
