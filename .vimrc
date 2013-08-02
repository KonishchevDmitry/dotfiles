" Enable pathogen plugin
call pathogen#infect()

" Enable ftplugin.
filetype plugin on


" Minimum window height
set winminheight=0

" Minimum window width
set winminwidth=0


" Use visual bell instead of beeping
set visualbell

" Use a popup menu to show the possible completions
set completeopt=menu

" Always show status line
set laststatus=2

" Configure status line
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" Bash style menu autocompletion
set wildmode=longest,list

" Show (partial) command in the last line of the screen.
" For example if you type 2d, Vim will show "2d" in last line of the screen.
set showcmd


" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>
set softtabstop=4

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Expand tabs to spaces
set expandtab

" Копирует отступ от предыдущей строки
set autoindent


" Enable syntax highlighting
syntax on

" Wrap long lines
set wrap

" Wrap long lines at a word rather than at the last character that fits on the
" screen
set linebreak

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in the
" line.
set whichwrap=b,s,<,>,[,],l,h


" Ignore case in a search pattern
set ignorecase

" Search while typing
set incsearch

" Do not search wrap around the end of the file
set nowrapscan

" When there is a previous search pattern, highlight all its matches
set hlsearch


" Disable backing up before overwriting a file
set nobackup

" Disable swap file creating
set noswapfile


" We have to set this variable to get "c" filetype for *.h files instead of "cpp"
let c_syntax_for_h=""

" Character encodings considered when starting to edit an existing file
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Viewing binary files in Vim
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78


" Enable console menu by pressing <F2>
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F2> :emenu <C-Z>

" Hotkeys -->
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
" Hotkeys <--


" Keyboard layout switching -->
    if has("macunix")
        " Native Mac OS X keyboard layout switching via KeyboardLayoutSwitcher
        " plugin

        " Store layout on InsertLeave and restore on InsertEnter
        let g:kls_insertEnterRestoresLast = 1
    elseif has("unix") && $DISPLAY != ""
        " Native X11 keyboard layout switching via vim-xkbswitch plugin

        " Path to the switcher library
        let g:XkbSwitchLib = $HOME."/.vim/libxkbswitch.so"

        if filereadable(g:XkbSwitchLib)
            " Enable the plugin
            let g:XkbSwitchEnabled = 1

            " Insert mappings duplicates for Russian winkeys layout will be
            " generated whenever Insert mode is started
            let g:XkbSwitchIMappings = ["ru"]
        endif
    endif

    if has("keymap")
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
    endif
" Keyboard layout switching <--


" Wrapper for :make -->
    function MyMake()
        " Do not open new tabs for *.py files - just compile the current
        " file.
        if &filetype == "python"
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
" Wrapper for :make <--


" Translating words with console version of StarDict -->
    function MyTranslateWord()
        let s:dict    = "sdcv"
        let s:phrase  = expand("<cword>")
        let s:tmpfile = tempname()

        silent execute "!" . s:dict . " " . s:phrase . " > " . s:tmpfile

        let s:lines = system("wc -l " . s:tmpfile . "| awk '{print $1}'")

        if s:lines == 0
            echo s:phrase . ": Not found."
        else
            execute "botright sp " . s:tmpfile
        end
    endfun

    map <silent> <F9> :call MyTranslateWord()<CR>
    menu Translate.Translate\ word<Tab><F9> :call MyTranslateWord()<CR>
" Translating words with console version of StarDict <--


" Restore buffer state when opening a file that was opened before -->
    " Restore cursor position and foldings
    set viewoptions=cursor,folds

    au BufReadPost * call MyLoadView()
    au BufUnload * call MyWriteView()

    function MyLoadView()
        " 'qf' is a make output window
        if &filetype != "" && &filetype != "qf"
            silent loadview
        end
    endfunction

    function MyWriteView()
        " 'qf' is a make output window
        if &filetype != "" && &filetype != "qf"
            mkview
        end
    endfunction
" Restore buffer state when opening a file that was opened before <--


" Full restoring of cursor position when switching between buffers, incuding
" column and window scrolling.
" -->
    autocmd BufEnter * call MyRestoreCursorPosition()
    autocmd BufLeave * call MySaveCursorPosition()

    function MyRestoreCursorPosition()
        if exists("b:curline")
            let b:saveve = &virtualedit
            let b:savesiso = &sidescrolloff

            set virtualedit=all
            set sidescrolloff=0
            execute "normal! ".b:midline."Gzz".b:curline."G0"
            let nw = wincol() - 1
            if b:curvcol != b:curwcol - nw
                execute "normal! ".b:algvcol."|zs"
                let s = wincol() - nw - 1
                if s != 0
                    execute "normal! ".s."zl"
                endif
            endif
            execute "normal! ".b:curvcol."|"

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
        let b:curline = line(".")
        let b:curvcol = virtcol(".")
        let b:curwcol = wincol()
        normal! g0
        let b:algvcol = virtcol(".") - 1
        normal! M
        let b:midline = line(".")
        execute "normal! ".b:curline."G".b:curvcol."|"

        let &virtualedit = b:saveve
        let &sidescrolloff = b:savesiso
    endfunction
" <--


" Switching between header and source file -->
    function MySwitchToForwardsHeader()
        if &filetype == "cpp"
            find %:t:r.hxx
            return
        end
    endfunction

    function MySwitchToForwardsHeaderInNewWindow()
        if &filetype == "cpp"
            sf %:t:r.hxx
            return
        end
    endfunction

    function MySwitchToHeader()
        if &filetype == "c"
            find %:t:r.h
            return
        elseif &filetype == "cpp"
            find %:t:r.hpp
            return
        end
    endfunction

    function MySwitchToHeaderInNewWindow()
        if &filetype == "c"
            sf %:t:r.h
            return
        elseif &filetype == "cpp"
            sf %:t:r.hpp
            return
        end
    endfunction

    function MySwitchToSource()
        if &filetype == "ch"
            find %:t:r.c
            return
        elseif &filetype == "cpp"
            find %:t:r.cpp
            return
        end
    endfunction

    function MySwitchToSourceInNewWindow()
        if &filetype == "ch"
            sf %:t:r.c<CR>
            return
        elseif &filetype == "cpp"
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
" Switching between header and source file <--


" OmniCppComplete -->
    " Enable global scope search
    let OmniCpp_GlobalScopeSearch = 1

    " Take into account namespace declarations
    let OmniCpp_NamespaceSearch = 2

    " Search for the local variable declarations
    let OmniCpp_LocalSearchDecl = 1


    " Autocompletion after .
    let OmniCpp_MayCompleteDot = 1

    " Autocompletion after ->
    let OmniCpp_MayCompleteArrow = 1

    " Autocompletion after ::
    let OmniCpp_MayCompleteScope = 1

    " Do not select the first item automatically
    let OmniCpp_SelectFirstItem = 0


    " Take into account the current scope (do not suggest private methods
    " outside the class).
    let OmniCpp_DisplayMode = 0

    " Show prototypes in suggestion list
    let OmniCpp_ShowPrototypeInAbbr = 1

    " Show access specifiers (public, protected, private: '+', " '#', '-').
    let OmniCpp_ShowAccess = 1
" OmniCppComplete <--


" jedi-vim (Python autocompletion)
"
" Notice: <leader> is \.
"
" Autocompletion by <C-Space>.
" Go to name definition by <leader g>.
" Go to entity definition by <leader d>.
" Refactor by <leader r>.
" Show all references <leader n>.
" Show pydoc by <K>.

" Don't automatically complete on dot
let g:jedi#popup_on_dot = 0


" Highlight textwidth column -->
    function HighlightTextWidthColumn()
        hi TextWidthColumn ctermbg=lightgray guibg=lightgray

        if !exists("w:TextWidthColumnMatch")
            let w:TextWidthColumnMatch = matchadd('TextWidthColumn', '\%<80v.\%>79v', -1)
        endif
    endfunction

    au BufWinEnter * call HighlightTextWidthColumn()
    call HighlightTextWidthColumn()
" Highlight textwidth column <--

" Highlight trailing whitespace -->
    function HighlightTrailingWhitespace()
        hi TrailingWhitespace ctermbg=lightgray guibg=lightgray

        if !exists("w:TrailingWhitespace")
            let w:TrailingWhitespace = matchadd('TrailingWhitespace', '\s\+$', -1)
        endif
    endfunction

    au BufWinEnter * call HighlightTrailingWhitespace()
    call HighlightTrailingWhitespace()
" Highlight trailing whitespace <--

" Source all configuration files
for config in ['file-encoding', 'spell-checking', 'tab-bar', 'tab-management']
    exec ':source ~/.vim/config/'.config.'.vim'
endfor
