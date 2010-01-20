call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))

" = appearance =
colorscheme kreuzberg
set guifont=Inconsolata:h18 "Envy_Code_R:h16

syntax on            " syntax highlighting on
set columns=999      " set columns
set lines=999        " max lines 
set number           " show line numbers
set cursorline       " highlight cursorline

set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set showmode         " show current mode down to bottom
set hlsearch

set laststatus=2     " always display the status line
set scrolloff=10     " keepmore context when scrolling off the end of a buffer 
set visualbell       " no beep

set fillchars=""     " no characters in window seperators
set statusline=%<%f\ %y%=\ [%1*%M%*%n%R%H]\ %-40(%3l,%02c%03V%)%O'%02b'
set cmdheight=2     " command line height 

set shellcmdflag=-ic

set guioptions-=T    " no toolbar 
set guioptions-=L    " no scrollbars on the left
set guioptions-=r    " no scrollbars on the right

" indention
filetype plugin indent on
set autoindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

set autoread         " autorefresh files that changed
set history=1000     " remember 1000 commands
set nowrap           " don't wrap lines

" display extra whitespace
"set list listchars=tab:»·,trail:·

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
set incsearch " jump to and mark match while typing
" case only matters 
set ignorecase
set smartcase

set splitright " opens new vertical split on the right 
set splitbelow " open horizontal spilt on the bottom

set clipboard=unnamed " let 'y' copy to clipboard under windows

let mapleader=","    " set leader to ','

" ctrl-] 
nnoremap ü <C-]>
nnoremap Ü <C-O>

" spell ",s"" = toggle spell on/off, language => ",de" or ",en" 
map <Leader>s :set spell! spell?<CR>
set spelllang=de
map <Leader>de :set spelllang=de<CR>:set spell<CR>
map <Leader>en :set spelllang=en<CR>:set spell<CR>

" Toggle line wrapping: ,w 
nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>
" Toggle search result highlighting: ,n
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" edit vim configuration
if has("win32")
    map <Leader>vr :e $VIMRUNTIME/../_vimrc<CR>
    au! BufWritePost _vimrc source % " Source _vimrc after each write
  else 
    map <Leader>vr :e ~/.vimrc<CR>
    au! BufWritePost .vimrc source % " reload .vimrc after each write
endif

" toggle NERDTree view
nmap <silent> <Leader>p :NERDTreeToggle<CR>

"map to fuzzy finder text mate stylez
nnoremap <c-f> :FuzzyFinderTextMate<CR>
 
"make Y consistent with C and D
nnoremap Y y$
 
"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Don't use Ex mode, use Q for formatting
map Q gq
 
" ,, switches to the last buffer used
map <leader><leader> <C-^>
map <Tab> :bn<CR>

" Maps autocomplete to ctrl-space
imap <C-Space> <C-N>

" Set ctrl-a and ctrl-e to jump to beginning and end of line respectively
imap <C-a> <C-o>^
imap <C-e> <C-o>$

" shift-enter
map <S-Enter> O<Esc>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" folding
set foldenable
set foldmethod=syntax
set foldlevel=1
set foldnestmax=5
set foldtext=MyFoldText()

" unaggressive folding text
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"Make current window the only one and store previous state
noremap <leader>o :call MaximizeToggle ()<CR>

" indent file 
map <Leader>i mx<Esc>gg=G<Esc>'x
" xml indention
map <Leader>xi mx<Esc>:%s/></>\r</g<CR>gg=G<Esc>'x

" cd to the directory containing the file in the buffer
nmap  ,cd :lcd %:h

command! W :w " wurstfinger fix: :W == :w 

" close window
map ä :q<CR>

" guesses the tab behavior by:
" 1: snippet if exists
" 2: autocomplete if exists
" 3: <tab>
" Note: switched off mappings in "snipMate.vim"" file under "after/plugin"
function! GuessTab()
  let inserted = TriggerSnippet()
  if inserted != "\<tab>"
    return inserted
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=GuessTab()<CR>
inoremap <s-tab> <c-n>

 
"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction
 
" == ruby == " == ruby == 
" cmd-r will run the given file
imap <D-r> <ESC><D-r>

"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

"imap ( ()<LEFT>
"imap [ []<LEFT>
"imap { {}<LEFT>
nmap <D-r> :!ruby %<CR>

" ruby focused unit test
map <Leader>m :w<CR>:!ruby %<CR>
"map <Leader>m :RunAllRubyTests<CR>
"map <Leader>m :w<CR><Plug>RubyFileRun

map <leader>l :call RunTestsForFile('')<cr>:redraw<cr>:call JumpToError()<cr>
map <leader>rc :RunRubyFocusedContext<CR>
map <Leader>rf :RunRubyFocusedUnitTest<CR>
map <Leader>rl :RunLastRubyTest<CR>

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif


" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

if has("win32")
  source $VIMRUNTIME/after/plugin/snipMate.vim
  source $VIMRUNTIME/mswin.vim
  set guifont=Envy_Code_R:h10:b
  nmap  ,rs :cd c:\development\workspaces\reg_service\Registry-core
  map <f5>  :w<CR>: !jruby %<enter>
   
  " HVP 
  map <f1> :lcd C:\Dokumente\ und\ Einstellungen\J19727\.dtc\12\DCs\eis.com\eaf\csc\war\uces\_comp\webContent\jsp\eisExtensions<CR>
  map <f2> :lcd C:\Dokumente\ und\ Einstellungen\J19727\.dtc\12\DCs\eis.com\eaf\csc\war\uces\_comp\webContent\jsp\eisExtensions<CR>:vimgrep -r /<C-R>=getreg('""')<cr>/ *<S-Left><S-Left><Right>
  map <f3> :lcd C:\Dokumente\ und\ Einstellungen\J19727\.dtc\12\DCs\eis.com\eaf\csc\war\uces\_comp\source\com\eonis\eea\hvp\csc\resources<CR>
  map <f4> :lcd C:\Dokumente\ und\ Einstellungen\J19727\.dtc\12\DCs\eis.com\eaf\csc\war\uces\_comp\source\com\eonis\eea\hvp\csc\resources<CR>:vimgrep -r /<C-R>=getreg('""')<cr>/ *<S-Left><S-Left><Right>

  autocmd BufWritePost *.properties  call CreateUnderscoreDe()
  function! CreateUnderscoreDe()
    exe '!type ' . fnameescape(expand("%")) . " > " . fnameescape(expand("%:r") . "_de.properties")
  endfunction

  map <f12> :call UmlauteToUTFCode()<CR>
  function! UmlauteToUTFCode()
    exe ':%s/ä/\\u000e/gc'
    exe ':%s/ö/\\u00f6/gc'
    exe ':%s/ü/\\u00fc/gc'
    exe ':%s/Ä/\\u00c4/gc'
    exe ':%s/Ö/\\u00d6/gc'
    exe ':%s/ü/\\u00dc/gc'
    exe ':%s/ß/\\u00df/gc'
    exe ':%s/©/\\u00a9/gc'
    exe ':%s//\\u00a9/gc'
    exe ':%s/©/\\u20ac/gc'
  endfunction

endif


