" Vim IDE configuration file
" TODO: refactor

" Загружаем ранее сохраненную сессию -->
	" Запрещаем восстановление настроек из сессии, т. к. тогда при изменении
	" ~/.vimrc даже после перезагрузки IDE новые настройки не будут вступать в
	" силу.
	set sessionoptions-=options,winsize

    if getfsize(".vim/ide.session") >= 0
        source .vim/ide.session
    endif
" Загружаем ранее сохраненную сессию <--

" Обновляем тэги при каждом сохранении файла
"au BufWritePost * call {MyUpdateCtagsFunction}()


" При закрытии Vim'а сохраняем информацию о текущей сессии
au VimLeave * :mksession! .vim/ide.session

    " ctags updating -->
        let g:ctags_sources_dirs = "."

        function! MyUpdateCtags()
            let l:cmd = "silent !ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q " . g:ctags_sources_dirs
            exe cmd
            let l:cmd = "silent !find " . g:ctags_sources_dirs . " -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' -o -name '*.hpp' -o -name '*.hxx' -o -name '*.h++' > cscope.files"
            exe cmd
            let l:cmd = "silent !cscope -b"
            exe cmd
            :silent cscope reset
        endfunction

        let MyUpdateCtagsFunction = "MyUpdateCtags"
        nmap <F11> :call {MyUpdateCtagsFunction}()<CR>

        menu ctags.Update<Tab><F11> <F11>
    " ctags updating <--


" Устанавливает правила синтаксиса, специфичные для данного проекта.
" -->
"    function! MySetIdeSyntax()
"        if getfsize(".vim/syntax.vim") >= 0
"            source .vim/syntax.vim
"        endif
"    endfunction
" <--

" Настраиваем работу с ctags -->
"    set tags=.vim/ctags
"
"    function! MyUpdateIdeCtags()
"        !make vim
"    endfunction
"
"    let MyUpdateCtagsFunction = "MyUpdateIdeCtags"
" Настраиваем работу с ctags <--

" Обновляем базу ctags при старте IDE
"call {MyUpdateCtagsFunction}()

" При открытии нового буфера устанавливаем для него
" правила синтаксиса, специфичные для данного проекта.
"au BufReadPost * :call MySetIdeSyntax()


python << EOF
"""
Adds all python modules in the current working directory to the path.

You can use `gf` to jump to the file of the module under the cursor.
"""

import os
import vim

module_paths = set()

def on_directory(arg, dir_name, names):
    if "__init__.py" in names:
        module_paths.add(dir_name)

os.path.walk(os.getcwd(), on_directory, None)

paths = set()

for module_path in module_paths:
    while module_path != "/":
        parent_dir = os.path.dirname(module_path)
        if parent_dir not in module_paths:
            break

        module_path = parent_dir

    paths.add(os.path.dirname(module_path))

for path in paths:
    vim.command("set path+=" + path.replace(" ", r"\ "))
EOF
