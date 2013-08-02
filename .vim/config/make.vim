" Wrapper for :make

function MyMake()
    " Do not open new tabs for *.py files - just compile the current
    " file.
    if &filetype == 'python'
        write
        make
        return
    endif

    let old_tab_num = tabpagenr()

    " Create a new tab
    tabe

    " Move it to the end
    tabm

    let old_buflist = tabpagebuflist(tabpagenr())
    make
    let buflist = tabpagebuflist(tabpagenr())

    " If the list of buffers hasn't changed then compilation completed
    " without errors and we can close the tab we just created - we
    " don't need it anymore.
    if old_buflist == buflist
        tabc
        execute 'tabn '.old_tab_num
    " Otherwise, error buffer will be opened in this tab
    else
        " Unfold all lines
        setlocal foldlevel=9999
    endif
endfunction

menu Make.Make<Tab>,m ,m
nmap ,m :call MyMake()<CR>

menu Make.Make\ Window<Tab>,w ,w
nmap ,w :cwindow<CR>

menu Make.Next\ Error<Tab>,n ,n
nmap ,n :cnext<CR>

menu Make.Previous\ Error<Tab>,p ,p
nmap ,p :cprevious<CR>

menu Make.Errors\ List<Tab>,l ,l
nmap ,l :clist<CR>
