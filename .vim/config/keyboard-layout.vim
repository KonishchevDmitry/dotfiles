" Keyboard layout switching

if has('unix') && $DISPLAY != ''
    " Native X11 keyboard layout switching via vim-xkbswitch plugin

    " Path to the switcher library
    let g:XkbSwitchLib = $HOME.'/.vim/libxkbswitch.so'

    if filereadable(g:XkbSwitchLib)
        " Enable the plugin
        let g:XkbSwitchEnabled = 1

        " Insert mappings duplicates for Russian winkeys layout will be
        " generated whenever Insert mode is started
        let g:XkbSwitchIMappings = ['ru']
    endif
endif

if has('keymap')
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
    "cmap <silent> <C-F> <C-^>
    "imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
    "nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
    "vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
endif
