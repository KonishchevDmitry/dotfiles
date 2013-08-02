" Tab bar formatting

function MyTabLine()
    let tabline = ''

    " Format all the tabs -->
        for i in range(tabpagenr('$'))
            " Highlight current tab
            if i + 1 == tabpagenr()
                let tabline .= '%#TabLineSel#'
            else
                let tabline .= '%#TabLine#'
            endif

            " Tab number
            let tabline .= '%' . (i + 1) . 'T'

            " Tab name
            let tabline .= '%{MyTabLabel(' . (i + 1) . ')}|'
        endfor
    " Format all the tabs <--

    " Fill free space
    let tabline .= '%#TabLineFill#%T'

    " Right aligned close button
    if tabpagenr('$') > 1
        let tabline .= '%=%#TabLine#%999XX'
    endif

    return tabline
endfunction

function MyTabLabel(n)
    let label = ''
    let buflist = tabpagebuflist(a:n)

    " File name -->
        let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

        if label == ''
            let label = '[No Name]'
        endif
    " File name <--

    " Tab number
    "let label .= ' ' . a:n

    " Highlight tab with unsaved changes
    for i in range(len(buflist))
        if getbufvar(buflist[i], '&modified')
            let label = '[+]'.label
            break
        endif
    endfor

    return label
endfunction

function MyGuiTabLabel()
    return '%{MyTabLabel('.tabpagenr().')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()
