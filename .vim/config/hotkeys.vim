" Hotkeys

" Boost cursor movement -->
    nmap <C-H> 5h
    nmap <C-J> 5j
    nmap <C-K> 5k
    nmap <C-L> 5l

    vmap <C-H> 5h
    vmap <C-J> 5j
    vmap <C-K> 5k
    vmap <C-L> 5l
" Boost cursor movement <--

" Cursor movement in the insert mode -->
    imap <C-J> <Left>
    imap <C-K> <Right>
    imap <C-L> <Del>

    cmap <C-J> <Left>
    cmap <C-K> <Right>
    cmap <C-L> <Del>
" Cursor movement in the insert mode <--

" Search the selected text -->
    vnoremap <silent> * :call MyVisualSearch('f')<CR>
    vnoremap <silent> # :call MyVisualSearch('b')<CR>

    function VisualSearch(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
" Search the selected text <--

" Comment arrows
map - $a --><Esc>
map = $a <--<Esc>

" Clear search highlighting
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>gv

" Save the buffer
nmap <F4> :w!<CR>
imap <F4> <Esc>:w!<CR>
vmap <F4> <Esc>:w!<CR>

" Quit
nmap <F5> :q<CR>
imap <F5> <Esc>:q<CR>
vmap <F5> <Esc>:q<CR>

" Removes all trailing space characters
nmap <F8> :%s/\s\+$//e<CR>:nohlsearch<CR><C-O>
imap <F8> <Esc><F8>
vmap <F8> <Esc><F8>

" Page Up/Down with saving cursor position
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>
