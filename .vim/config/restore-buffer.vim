" Restore buffer state when opening a file that has been opened before

" Restore cursor position and foldings
set viewoptions=cursor,folds

au BufReadPost * call MyLoadView()
au BufUnload * call MyWriteView()

function MyLoadView()
    " 'qf' is a make output window
    if &filetype != '' && &filetype != 'qf'
        silent loadview
    end
endfunction

function MyWriteView()
    " 'qf' is a make output window
    if &filetype != '' && &filetype != 'qf'
        mkview
    end
endfunction
