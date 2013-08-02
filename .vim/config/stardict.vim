" Translating words with console version of StarDict

function MyTranslateWord()
    let s:dict = 'sdcv'
    let s:phrase = expand('<cword>')
    let s:tmpfile = tempname()

    silent execute '!'.s:dict.' '.s:phrase.' > '.s:tmpfile

    let s:lines = system('wc -l '.s:tmpfile.'| awk ''{print $1}''')

    if s:lines == 0
        echo s:phrase.': Not found.'
    else
        execute 'botright sp '.s:tmpfile
    end
endfun

map <silent> <F9> :call MyTranslateWord()<CR>
menu Translate.Translate\ word<Tab><F9> :call MyTranslateWord()<CR>
