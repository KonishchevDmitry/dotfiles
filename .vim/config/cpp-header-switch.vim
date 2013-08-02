" Switching between header and source file

function MySwitchToForwardsHeader()
    if &filetype == 'cpp'
        find %:t:r.hxx
        return
    end
endfunction

function MySwitchToForwardsHeaderInNewWindow()
    if &filetype == 'cpp'
        sf %:t:r.hxx
        return
    end
endfunction

function MySwitchToHeader()
    if &filetype == 'c'
        find %:t:r.h
        return
    elseif &filetype == 'cpp'
        find %:t:r.hpp
        return
    end
endfunction

function MySwitchToHeaderInNewWindow()
    if &filetype == 'c'
        sf %:t:r.h
        return
    elseif &filetype == 'cpp'
        sf %:t:r.hpp
        return
    end
endfunction

function MySwitchToSource()
    if &filetype == 'ch'
        find %:t:r.c
        return
    elseif &filetype == 'cpp'
        find %:t:r.cpp
        return
    end
endfunction

function MySwitchToSourceInNewWindow()
    if &filetype == 'ch'
        sf %:t:r.c<CR>
        return
    elseif &filetype == 'cpp'
        sf %:t:r.cpp<CR>
        return
    end
endfunction

nmap ,f :call MySwitchToForwardsHeader()<CR>
nmap ,F :call MySwitchToForwardsHeaderInNewWindow()<CR>
nmap ,h :call MySwitchToHeader()<CR>
nmap ,H :call MySwitchToHeaderInNewWindow()<CR>
nmap ,s :call MySwitchToSource()<CR>
nmap ,S :call MySwitchToSourceInNewWindow()<CR>
