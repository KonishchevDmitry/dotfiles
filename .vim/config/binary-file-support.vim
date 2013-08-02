" View binary files in Vim

au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
