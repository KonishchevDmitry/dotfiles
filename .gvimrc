" Setting up colorscheme
color default

" Highlight the screen line of the cursor
set cursorline

" Set GUI font
if has("mac")
    set guifont=Menlo\ Regular:h15
else
    set guifont=Ubuntu\ Mono\ 12
endif


" Disable toolbar
set guioptions-=T

" Disable GUI tabs
set guioptions-=e

" Use console dialogs instead of popup dialogs for simple choices
set guioptions+=c

if !has("mac")
    " Hide menu bar
    set guioptions-=m

    " Menu bar toggling -->
        function MyToggleMenu()
            let old_guioptions = &guioptions

            if stridx(old_guioptions, 'm') != -1
                set guioptions-=m
            else
                set guioptions+=m
            endif
        endfunction

        cmap <F12> <ESC>:call MyToggleMenu()<CR>
        imap <F12> <ESC>:call MyToggleMenu()<CR>
        nmap <F12> :call MyToggleMenu()<CR>
        vmap <F12> <ESC>:call MyToggleMenu()<CR>
    " Menu bar toggling <--
endif
