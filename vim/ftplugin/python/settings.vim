" Custom settings for Python files

" Enable extended syntax highlighting
let python_highlight_all = 1

" Enable smart indenting
setlocal smartindent
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

" Tune smart indent to prevent moving cursor to the beginning of the string
" when we start a comment.
inoremap # X<C-H>#

" Setting up :make command.
" Checks syntax of the file by compiling it.
setlocal makeprg=python\ -c\ \"import\ py_compile,sys,tempfile;\ sys.stderr=sys.stdout;\ output=tempfile.NamedTemporaryFile();\ py_compile.compile(\'%\',output.name)\"
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

python << EOF
"""
Adds all python modules to the path.

You can use `gf` to jump to the file of the module under the cursor.
"""

import os
import sys
import vim

for path in sys.path:
    if os.path.isdir(path):
        vim.command(r"set path+=" + path.replace(" ", r"\ "))
EOF

