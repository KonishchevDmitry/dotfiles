" TODO: refactor
" Highlight the screen line of the cursor
set cursorline


" Disable toolbar
set guioptions-=T

" Hide menu bar
set guioptions-=m

" Disable GUI tabs
set guioptions-=e

" Use console dialogs instead of popup dialogs for simple choices
set guioptions+=c


" TODO
" Enable spell checking by default
set spell spelllang=ru,en

" Set GUI font
set guifont=Ubuntu\ Mono\ 12

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


"set guifont=Menlo\ Regular:h14
"color default
"	if has("gui_running")
"	    if has("gui_gtk2")
"		:set guifont=Luxi\ Mono\ 12
"	    elseif has("x11")
"		" Also for GTK 1
"		:set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
"	    elseif has("gui_win32")
"		:set guifont=Luxi_Mono:h12:cANSI
"	    elseif has("gui_macvim")
"	        :set guifont=DejaVu\ Sans\ Mono:h13
"	    endif
"	endif
