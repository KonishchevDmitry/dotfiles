" Tab management

function TabJump(direction)
    let l:tablen = tabpagenr('$')
    let l:tabcur = tabpagenr()

    if a:direction=='left'
        if l:tabcur > 1
            execute 'tabprevious'
        else
            execute 'tablast'
        endif
    else
        if l:tabcur != l:tablen
            execute 'tabnext'
        else
            execute 'tabfirst'
        endif
    endif
endfunction

function TabMove(direction)
    let l:tablen = tabpagenr('$')
    let l:tabcur = tabpagenr()

    if a:direction == 'left'
        if l:tabcur > 1
            execute 'tabmove' l:tabcur-2
        endif
    else
        if l:tabcur != l:tablen
            execute 'tabmove' l:tabcur
        endif
    endif
endfunction

" Previous tab
nnoremap <silent><A-UP> :call TabJump('left')<CR>
inoremap <silent><A-UP> <C-O>:call TabJump('left')<CR>
vnoremap <silent><A-UP> <ESC>:call TabJump('left')<CR>

" Next tab
nnoremap <silent><A-DOWN> :call TabJump('right')<CR>
inoremap <silent><A-DOWN> <C-O>:call TabJump('right')<CR>
vnoremap <silent><A-DOWN> <ESC>:call TabJump('right')<CR>

" Move current tab backwards
nnoremap <silent><A-S-UP> :call TabMove('left')<CR>
inoremap <silent><A-S-UP> <C-O>:call TabMove('left')<CR>
vnoremap <silent><A-S-UP> <ESC>:call TabMove('left')<CR>

" Move current tab forward
nnoremap <silent><A-S-DOWN> :call TabMove('right')<CR>
inoremap <silent><A-S-DOWN> <C-O>:call TabMove('right')<CR>
vnoremap <silent><A-S-DOWN> <ESC>:call TabMove('right')<CR>
