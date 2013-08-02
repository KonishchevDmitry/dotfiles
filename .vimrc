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


" Source all configuration files
source ~/.vim/config/binary-file-support.vim
source ~/.vim/config/cpp-header-switch.vim
source ~/.vim/config/file-encoding.vim
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
