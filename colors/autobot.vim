"   Description: A bold colour-scheme inspired by the Autobots. Currently only concerned with PHP syntax.
"    Maintainer: mwaddilove@gmail.com
"       Version: 0.2.3

let colors_name = "autobot"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

" 230 off-white
" 45  electric blue
" 31  blue-grey
" 220 yellow
" 160 red
" 241 light grey
" 236 grey
" 233 almost black
" 0   black

hi Normal       ctermfg=230     ctermbg=233     cterm=none
hi Function     ctermfg=45      ctermbg=233     cterm=bold
hi Special      ctermfg=160     ctermbg=233     cterm=none
hi Constant     ctermfg=220     ctermbg=233     cterm=none
hi Comment      ctermfg=241     ctermbg=233     cterm=none
hi Statement    ctermfg=31      ctermbg=233     cterm=none
hi Cursor 	ctermfg=233	ctermbg=254     cterm=none
hi CursorLine  	                ctermbg=238	cterm=none
hi LineNr       ctermfg=238     ctermbg=0       cterm=none
hi StatusLine   ctermfg=0       ctermbg=230     cterm=none
hi StatusLineNC ctermfg=0       ctermbg=238     cterm=none
hi Search       ctermfg=160     ctermbg=230     cterm=none
hi IncSearch    ctermfg=0       ctermbg=230     cterm=none
hi Error        ctermfg=230     ctermbg=160     cterm=none
hi ExtraWhitespace              ctermbg=160

hi! link    Operator    Special
hi! link    Number      Constant
hi! link    String      Constant
hi! link    Type        Statement
hi! link    PreProc     Statement
hi! link    SignColumn  LineNr
hi! link    Directory   Statement
hi! link    Title       Special

" PHP specific
hi phpVarSelector    ctermfg=187      ctermbg=233
hi phpMemberSelector ctermfg=24       ctermbg=233  cterm=none

hi! link    phpIdentifier       Normal
hi! link    phpFunction         Function
hi! link    phpClasses          Function
hi! link    phpOperator         Special
hi! link    phpKeyword          Special
hi! link    phpType             Special
hi! link    phpRegion           Statement
hi! link    phpStaticClasses    Statement
hi! link    phpMethodsVar       Statement
hi! link    phpParent           Statement

" YAML specific
hi! link yamlKey    Statement

" Javascript specific
hi! link javaScriptStringD      Normal
