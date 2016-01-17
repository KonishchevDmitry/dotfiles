" All filetype plugins use `setlocal` to change settings of current buffer
" only, but it has issues with tabs: `setlocal` changes settings only for
" current buffer, but their scope are limited to current tab because the
" settings somehow stick to windows and each tab has its own windows. In
" result we got the following: if we open a file that has been opened in other
" tab (even if its window is already closed buffer probably hasn't been
" unloaded) Vim loads its buffer to the tab's window but its filetype settings
" aren't active in this window which looks like if we don't load a filetype
" plugin for the file at all. Fix the issue by activating filetype plugin
" every time it's loaded into a window.

au BufWinEnter * call ReloadFiletypePlugin()

function ReloadFiletypePlugin()
    if &filetype != ''
        execute "set filetype=" . &filetype
    end
endfunction
