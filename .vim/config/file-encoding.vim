" File encoding menu

" File encoding to read
menu Encoding.Read.UTF-8 :e ++enc=utf8<CR>
menu Encoding.Read.Windows-1251 :e ++enc=cp1251<CR>
menu Encoding.Read.KOI8-R :e ++enc=koi8-r<CR>
menu Encoding.Read.CP866 :e ++enc=cp866<CR>

" File encoding to write
menu Encoding.Write.UTF-8 :set fenc=utf8<CR>
menu Encoding.Write.Windows-1251 :set fenc=cp1251<CR>
menu Encoding.Write.KOI8-R :set fenc=koi8-r<CR>
menu Encoding.Write.CP866 :set fenc=cp866<CR>

" End of line format (dos - <CR><NL>, unix - <NL>)
menu Encoding.End\ of\ line\ format.UNIX :set fileformat=unix<CR>
menu Encoding.End\ of\ line\ format.DOS :set fileformat=dos<CR>
