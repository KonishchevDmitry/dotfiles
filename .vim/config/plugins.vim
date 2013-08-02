" Plugin configuration


" jedi-vim (Python autocompletion)
"
" Notice: <leader> is \.
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
