" Plugin configuration
"
" Notice: <leader> is \.


" NERDTree

nmap <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0



" CtrlP

let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {'file': '\v\.(bak|pyc)$'}



" jedi-vim (Python autocompletion)
"
" Autocompletion by <C-Space>.
" Go to name definition by <leader g>.
" Go to entity definition by <leader d>.
" Refactor by <leader r>.
" Show all references <leader n>.
" Show pydoc by <K>.

" Don't automatically complete on dot
let g:jedi#popup_on_dot = 0



" OmniCppComplete (C++ autocompletion)

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1

" Take into account namespace declarations
let OmniCpp_NamespaceSearch = 2

" Search for the local variable declarations
let OmniCpp_LocalSearchDecl = 1


" Autocompletion after .
let OmniCpp_MayCompleteDot = 1

" Autocompletion after ->
let OmniCpp_MayCompleteArrow = 1

" Autocompletion after ::
let OmniCpp_MayCompleteScope = 1

" Do not select the first item automatically
let OmniCpp_SelectFirstItem = 0


" Take into account the current scope (do not suggest private methods
" outside the class).
let OmniCpp_DisplayMode = 0

" Show prototypes in suggestion list
let OmniCpp_ShowPrototypeInAbbr = 1

" Show access specifiers (public, protected, private: '+', " '#', '-').
let OmniCpp_ShowAccess = 1
