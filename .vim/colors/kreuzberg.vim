" Vim color scheme - "kreuzberg.vim"
" author: Joe Hannes
"
" inspired by blackboard, vividchalk and xoria256 

set background=dark

hi clear

syntax reset

let colors_name = "kreuzberg"

hi  link railsMethod            PreProc
hi  link rubyDefine             Keyword
hi  link rubySymbol             Constant
hi  link rubyAccess             rubyMethod
hi  link rubyAttribute          rubyMethod
hi  link rubyEval               rubyMethod
hi  link rubyException          rubyMethod
hi  link rubyInclude            rubyMethod
hi  link rubyStringDelimiter    rubyString
hi  link rubyRegexp             Regexp
hi  link rubyRegexpDelimiter    rubyRegexp
"hi link rubyConstant           Variable
"hi link rubyGlobalVariable     Variable
"hi link rubyClassVariable      Variable
"hi link rubyInstanceVariable   Variable
hi  link javascriptRegexpString Regexp
hi  link javascriptNumber       Number
hi  link javascriptNull         Constant
hi  link diffAdded              String
hi  link diffRemoved            Statement
hi  link diffLine               PreProc
hi  link diffSubname            Comment
hi  link Directory              Identifier
hi  link Question               MoreMsg
hi  link FoldColumn             Folded

hi Normal        guibg=#1c1c1c guifg=#ffffff ctermbg=Black
hi NonText  		 guibg=#1c1c1c guifg=#808080 gui=none
hi Todo          guifg=#118800 guibg=#171717
hi StatusLineNC  guifg=#f6f3e8 guibg=#303030 gui=italic
hi StatusLine    guifg=#303030 guibg=#aaaaaa gui=none
hi Ignore        ctermfg=Black
hi WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
hi Cursor 		   guifg=NONE    guibg=#656565 gui=none
hi CursorLine    guibg=#202020
hi CursorColumn  guibg=#2d2d2d
hi SpecialKey	   guifg=#808080 guibg=#343434 gui=none
hi Directory     none
hi ErrorMsg      guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
hi IncSearch     guifg=#118800 guibg=#ffffff ctermfg=White ctermbg=Black
hi MoreMsg       guifg=#00AA00 ctermfg=Green
hi LineNr 		   guifg=#555555 guibg=#1c1c1c gui=none
hi VertSplit 	   guifg=#222222 guibg=#303030 gui=none
hi Question      none
hi Title		     guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		     guifg=#f6f3e8 guibg=#666666 gui=none
hi VisualNOS     guibg=#444444 gui=none cterm=none
hi WarningMsg    guifg=Red ctermfg=Red
hi Error         ctermbg=DarkRed
hi SpellBad      ctermbg=DarkRed
hi SpellRare     ctermbg=DarkMagenta
hi SpellCap      ctermbg=DarkBlue
hi SpellLocal    ctermbg=DarkCyan

hi Folded 		   guifg=#cccccc guibg=#272727 gui=none
hi FoldColumn    none
hi DiffAdded     ctermfg=150 guifg=#afdf87
hi DiffRemoved   ctermfg=174 guifg=#df8787
hi DiffAdd       ctermfg=bg  guifg=bg      ctermbg=151 guibg=#afdfaf
hi DiffDelete    ctermfg=bg  guifg=bg      ctermbg=246 guibg=#949494 cterm=none gui=none
hi DiffChange    ctermfg=bg  guifg=bg      ctermbg=181 guibg=#dfafaf
hi DiffText      ctermfg=bg  guifg=bg      ctermbg=174 guibg=#df8787 cterm=none gui=none
hi MatchParen    guifg=#d2fa3c guibg=#1a1a1a gui=bold
hi Pmenu         guifg=#f6f3e8 guibg=#444444
hi PmenuSel      guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Search        guifg=#ffffff guibg=#118800   
hi PmenuSbar     guibg=Grey ctermbg=Grey
hi PmenuThumb    guibg=White ctermbg=White
hi TabLine       guifg=#333333 guibg=#bbbbbb gui=underline cterm=underline
hi TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
hi TabLineFill   guifg=#bbbbbb guibg=#808080 gui=underline cterm=underline

hi Type            gui=none
hi Statement       gui=none
hi railsUserClass  gui=italic
hi railsUserMethod gui=italic
hi Identifier      cterm=none

hi Comment         guifg=#999999
hi Constant        guifg=#d2fa3c
hi rubyNumber      guifg=#fbde2d
hi String          guifg=#61ce3c
hi Identifier      guifg=#d2fa3c
hi Statement       guifg=#fbde2d
hi PreProc         guifg=#fbde2d
hi railsUserMethod guifg=#ff0000
hi Type            guifg=#d2fa3c
hi railsUserClass  guifg=#ff0000
hi Special         guifg=#118800
hi Regexp          guifg=#61ce3c
hi rubyMethod      guifg=#d2fa3c
