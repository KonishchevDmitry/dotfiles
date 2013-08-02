" Spell checking

" Tune syntax highlighting
hi clear SpellBad

" MacVim complains about undercurl in console mode
if has("gui_running")
    hi SpellBad cterm=underline guisp=undercurl
else
    hi SpellBad cterm=underline
endif

" Enable spell checking by default
set spell spelllang=ru,en

menu Spell.Off :set spelllang=<CR>:set nospell<CR>
menu Spell.On :set spell spelllang=ru,en<CR>
menu Spell.-SpellControl- :
menu Spell.Word\ Suggest<Tab>z= z=
menu Spell.Add\ To\ Dictionary<Tab>zg zg
menu Spell.Add\ To\ TemporaryDictionary<Tab>zG zG
menu Spell.Remove\ From\ Dictionary<Tab>zw zw
menu Spell.Remove\ From\ Temporary\ Dictionary<Tab>zW zW
menu Spell.Previous\ Wrong\ Word<Tab>[s [s
menu Spell.Next\ Wrong\ Word<Tab>]s ]s

function MyToggleSpellCheck()
    if &spelllang == ""
        setlocal spell
        setlocal spelllang=ru,en
        echo "Spelllang: ru,en"
    else
        setlocal spelllang=
        setlocal nospell
        echo "Spelllang: off"
    endif
endfunc

" Toggle spell checking hotkey
nmap <silent> <F10> :call MyToggleSpellCheck()<CR>
