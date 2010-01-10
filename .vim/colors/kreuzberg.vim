" Vim color scheme - "kreuzberg.vim"
" author: Joe Hannes

" inspired by blackboard theme 

if has("gui_running")
    set background=dark
endif

hi clear

if exists("syntax_on")
   syntax reset
endif

let colors_name = "kreuzberg"

" First two functions adapted from inkpot.vim

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
    return strpart("0245", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! E2T(a)
    return s:X(a:a)
endfunction

function! s:choose(mediocre,good)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,first,second,...)
    if a:0 && &t_Co == 256
        let ctermfg = a:1
    else
        let ctermfg = s:choose(a:first,a:second)
    endif
    exe "hi ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,first,second)
    let ctermbg = s:choose(a:first,a:second)
    exe "hi ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

hi link railsMethod         PreProc
hi link rubyDefine          Keyword
hi link rubySymbol          Constant
hi link rubyAccess          rubyMethod
hi link rubyAttribute       rubyMethod
hi link rubyEval            rubyMethod
hi link rubyException       rubyMethod
hi link rubyInclude         rubyMethod
hi link rubyStringDelimiter rubyString
hi link rubyRegexp          Regexp
hi link rubyRegexpDelimiter rubyRegexp
"hi link rubyConstant        Variable
"hi link rubyGlobalVariable  Variable
"hi link rubyClassVariable   Variable
"hi link rubyInstanceVariable Variable
hi link javascriptRegexpString  Regexp
hi link javascriptNumber        Number
hi link javascriptNull          Constant
hi link diffAdded        String
hi link diffRemoved      Statement
hi link diffLine         PreProc
hi link diffSubname      Comment
hi link Directory     Identifier
hi link Question      MoreMsg
hi link FoldColumn    Folded

call s:hifg("Normal","#EEEEEE","White",87)
if &background == "light" || has("gui_running")
    hi Normal guibg=Black ctermbg=Black
else
    hi Normal guibg=Black ctermbg=NONE
endif

hi StatusLine    guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC  guifg=#857b6f guibg=#aaaaaa gui=none
hi Ignore        ctermfg=Black
hi WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
hi Cursor 		   guifg=NONE    guibg=#656565 gui=none
hi CursorLine    guibg=#111111
hi CursorColumn  guibg=#2d2d2d
hi NonText  		 guifg=#808080 guibg=#000000 gui=none
hi SpecialKey	   guifg=#808080 guibg=#343434 gui=none
hi Directory     none
hi ErrorMsg      guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
hi IncSearch     guifg=#118800 guibg=#ffffff ctermfg=White ctermbg=Black
hi MoreMsg       guifg=#00AA00 ctermfg=Green
hi LineNr 		   guifg=#303030 guibg=#000000 gui=none
hi VertSplit 	   guifg=#222222 guibg=#444444 gui=none
hi Question      none
hi Title		     guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		     guifg=#f6f3e8 guibg=#444444 gui=none
hi VisualNOS     guibg=#444444 gui=none cterm=none
hi MatchParen    guibg=#118800
hi WarningMsg    guifg=Red ctermfg=Red
hi Error         ctermbg=DarkRed
hi SpellBad      ctermbg=DarkRed
" FIXME: Comments
hi SpellRare     ctermbg=DarkMagenta
hi SpellCap      ctermbg=DarkBlue
hi SpellLocal    ctermbg=DarkCyan

hi Folded 		    guifg=#999999 guibg=#101010 gui=none
hi FoldColumn    none
hi DiffAdd       ctermbg=4 guibg=DarkBlue
hi DiffChange    ctermbg=5 guibg=DarkMagenta
hi DiffDelete    ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText      ctermbg=DarkRed
hi DiffText      cterm=bold ctermbg=9 gui=bold guibg=Red
hi MatchParen    guifg=#f6f3e8 guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
hi Pmenu         guifg=#f6f3e8 guibg=#444444
hi PmenuSel      guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Search        guifg=#ffffff guibg=#118800   

hi PmenuSbar     guibg=Grey ctermbg=Grey
hi PmenuThumb    guibg=White ctermbg=White
hi TabLine       guifg=#333333 guibg=#bbbbbb gui=underline cterm=underline
hi TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
hi TabLineFill   guifg=#bbbbbb guibg=#808080 gui=underline cterm=underline

hi Type gui=none
hi Statement gui=none
if !has("gui_mac")
    " Mac GUI degrades italics to ugly underlining.
    hi Comment gui=italic
    hi railsUserClass  gui=italic
    hi railsUserMethod gui=italic
endif
hi Identifier cterm=none

hi Comment guifg=#aeaeae
hi Constant guifg=#d2fa3c
hi rubyNumber guifg=#fbde2d
hi String guifg=#61ce3c
hi Identifier guifg=#d2fa3c
hi Statement guifg=#fbde2d
hi PreProc guifg=#fbde2d
hi railsUserMethod guifg=#ff0000
hi Type guifg=#d2fa3c
hi railsUserClass guifg=#ff0000
hi Special guifg=#118800
hi Regexp guifg=#61ce3c
hi rubyMethod guifg=#d2fa3c

