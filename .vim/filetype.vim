" Contains autocommands to detect the file type

if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    " Vim doesn't detect *.h file type properly out of the box
    au! BufRead,BufNewFile *.h setfiletype ch
augroup END
