" Vim IDE configuration file


" Load project configuration
if filereadable(".vim/ide.vim")
    source .vim/ide.vim
endif

" Do not restore settings from the session to not override settings from
" .vimrc file
set sessionoptions-=options,winsize

" Restore saved session
if getfsize(".vim/ide.session") >= 0
    source .vim/ide.session
endif

" Save the session on exit
au VimLeave * :mksession! .vim/ide.session


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


" ctags -->
function MyHandleCtags(action)
python << EOF
"""
Configures ctags for the current buffer depending on its file type.
"""

import os
import subprocess
import vim

# File that is being edited
file_path = vim.current.buffer.name

# Supported languages
languages = [{
    "name":       "cpp",
    "extensions": [ ".c", ".h", ".cpp", ".cxx", ".c++", ".hpp", ".hxx", ".h++" ],
}]


def update_ctags(language):
    """Updates ctags for the specified language."""

    find_command = [ "find" ]
    for id, extension in enumerate(language["extensions"]):
        if id: find_command += [ "-o" ]
        find_command += [ "-name", "*" + extension ]

    ctags_command = [ "ctags" ]
    if language["name"] == "cpp":
        ctags_command += [ "--c-kinds=+pl", "--c++-kinds=+pl", "--fields=+iaS", "--extra=+q" ]
    ctags_command += [ "-L", "-", "-f", ".vim/{0}.tags".format(language["name"]) ]


    find_process = None
    ctags_process = None

    try:
        find_process = subprocess.Popen(find_command, stdout = subprocess.PIPE)
        ctags_process = subprocess.Popen(ctags_command, stdin = find_process.stdout)
    finally:
        if find_process is not None:
            find_process.wait()

        if ctags_process is not None:
            ctags_process.wait()


if file_path is None:
    pass
elif vim.eval("a:action") == "on-read":
    for language in languages:
        if os.path.splitext(file_path)[1] in language["extensions"]:
            vim.command("setlocal tags+=.vim/{language}.tags".format(
                language = language["name"]))
            break
elif vim.eval("a:action") == "on-write":
    if file_path.startswith(os.getcwd()):
        for language in languages:
            if os.path.splitext(file_path)[1] in language["extensions"]:
                update_ctags(language)
                break
EOF
endfunction

au BufRead * call MyHandleCtags("on-read")
au BufWritePost * call MyHandleCtags("on-write")
" ctags <--
