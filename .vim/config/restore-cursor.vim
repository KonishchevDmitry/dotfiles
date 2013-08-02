" Full restoring of cursor position when switching between buffers, including
" column and window scrolling.

autocmd BufEnter * call MyRestoreCursorPosition()
autocmd BufLeave * call MySaveCursorPosition()

function MyRestoreCursorPosition()
    if exists('b:curline')
        let b:saveve = &virtualedit
        let b:savesiso = &sidescrolloff

        set virtualedit=all
        set sidescrolloff=0
        execute 'normal! '.b:midline.'Gzz'.b:curline.'G0'
        let nw = wincol() - 1
        if b:curvcol != b:curwcol - nw
            execute 'normal! '.b:algvcol.'|zs'
            let s = wincol() - nw - 1
            if s != 0
                execute 'normal! '.s.'zl'
            endif
        endif
        execute 'normal! '.b:curvcol.'|'

        let &virtualedit = b:saveve
        let &sidescrolloff = b:savesiso
        unlet b:saveve b:savesiso b:curline b:curvcol b:curwcol b:algvcol b:midline
    endif
endfunction

function MySaveCursorPosition()
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff

    set virtualedit=all
    set sidescrolloff=0
    let b:curline = line('.')
    let b:curvcol = virtcol('.')
    let b:curwcol = wincol()
    normal! g0
    let b:algvcol = virtcol('.') - 1
    normal! M
    let b:midline = line('.')
    execute 'normal! '.b:curline.'G'.b:curvcol.'|'

    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
endfunction
