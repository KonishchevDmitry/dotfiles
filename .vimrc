" Enable pathogen plugin
call pathogen#infect()

" Enable ftplugin
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
" For example if you type 2d, Vim will show '2d' in last line of the screen.
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

" Copy indent from current line when starting a new line
set autoindent

" Makes backspace behave like in traditional editors + fixes some weird
" behaviour of backspace when autoindent is on
set backspace=indent,eol,start


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


" Allow to switch buffer when there are unsaved changes in current buffer
" (useful in plugins that for example jump you from the source to definition).
set hidden

" Disable swap file creating
set noswapfile

" Disable backing up before overwriting a file
set nobackup

" When Vim is called from crontab -e it will not work if the 'backup' option
" is set to no or auto ('crontab: temp file must be edited in place' error
" message is returned). This setting fixes the issue.
if has('macunix')
    set backupskip+=/private/tmp/*
endif


" Assume that we always support at least 256 colors
if !has('gui_running') && &t_Co < 256
    set t_Co=256
endif

" Set different color scheme for vimdiff
"if &diff
"    colorscheme delek
"endif


" Source all configuration files
source ~/.vim/config/binary-file-support.vim
source ~/.vim/config/coding-style.vim
source ~/.vim/config/cpp-header-switch.vim
source ~/.vim/config/file-encoding.vim
source ~/.vim/config/ftplugin-fix.vim
source ~/.vim/config/highlight.vim
source ~/.vim/config/hotkeys.vim
source ~/.vim/config/keyboard-layout.vim
source ~/.vim/config/make.vim
source ~/.vim/config/menu.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/restore-buffer.vim
source ~/.vim/config/restore-cursor.vim
source ~/.vim/config/spell-checking.vim
source ~/.vim/config/stardict.vim
source ~/.vim/config/tab-bar.vim
source ~/.vim/config/tab-management.vim
