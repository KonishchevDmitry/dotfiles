

" Keyboard mapping switching -->
    " Keyboard mapping to switch to on <C-^>
    set keymap=russian-jcukenwin

    " Default keyboard mapping is English
    set iminsert=0

    " Default keyboard mapping for search is English
    set imsearch=-1

    " Sets status line color depending on current keyboard mapping
    function MyKeyMapHighlight()
        if &iminsert == 0
            hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
        else
            hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
        endif
    endfunction

    " Set colors on Vim startup
    call MyKeyMapHighlight()

    " Update status line color on window switching
    au WinEnter * :call MyKeyMapHighlight()

    " Keyboard mapping switching by <C-F>
    cmap <silent> <C-F> <C-^>
    imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
    nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
    vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" Keyboard mapping switching <--

" TODO
"if has("keymap")
"if has("python")
"if has("mac")
"echo "MAC"
"else
"echo "no mac"
"endif
"" Привязка клавиш для русской раскладки -->
"    map ё `
"    map й q
"    map ц w
"    map у e
"    map к r
"    map е t
"    map н y
"    map г u
"    map ш i
"    map щ o
"    map з p
"    map х [
"    map ъ ]
"    map ф a
"    map ы s
"    map в d
"    map а f
"    map п g
"    map р h
"    map о j
"    map л k
"    map д l
"    map ж ;
"    map э '
"    map я z
"    map ч x
"    map с c
"    map м v
"    map и b
"    map т n
"    map ь m
"    map б ,
"    map ю .
"    map . /
"
"    map Ё ~
"    map Й Q
"    map Ц W
"    map У E
"    map К R
"    map Е T
"    map Н Y
"    map Г U
"    map Ш I
"    map Щ O
"    map З P
"    map Х {
"    map Ъ }
"    map Ф A
"    map Ы S
"    map В D
"    map А F
"    map П G
"    map Р H
"    map О J
"    map Л K
"    map Д L
"    map Ж :
"    map Э "
"    map Я Z
"    map Ч X
"    map С C
"    map М V
"    map И B
"    map Т N
"    map Ь M
"    map Б <
"    map Ю >
"    map , ?
"
"    map ; $
"" Привязка клавиш для русской раскладки <--
