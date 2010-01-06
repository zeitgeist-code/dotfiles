call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))

syntax on
filetype plugin indent on
"colorscheme vividchalk
"colorscheme wombat
colorscheme custom

set cursorline

if (has('gui_running'))
  set guifont=Envy_Code_R:h16
  set guioptions-=T
  set columns=999
  set lines=999
  set number
endif
 
autocmd FileType ruby runtime ruby_mappings.vim

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set history=1000  " remember 1000 commands

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmode      " show current mode down to bottom

"set nowrap        " don't wrap lines

let mapleader = ","  " override default leader '\' to ','

nmap <silent> <Leader>p :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
 
"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>
 
"map to fuzzy finder text mate stylez
nnoremap <c-f> :FuzzyFinderTextMate<CR>
 
"make Y consistent with C and D
nnoremap Y y$
 
"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Don't use Ex mode, use Q for formatting
map Q gq
 
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
 
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif


" Maps autocomplete to ctrl-space
imap <C-Space> <C-N>

" shift-enter
map <S-Enter> O<Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Reload .vimrc after each write
  au! BufWritePost .vimrc source % 
  
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent  " always set autoindenting on

endif " has("autocmd")

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif
 
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
 
" Always display the status line
set laststatus=2
 
" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>
 
" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

" indent file
map <Leader>i gg=G

" ruby focused unit test
map <Leader>m :RunAllRubyTests<CR>
map <C-a> :w<CR>:RunAllRubyTests<CR>
map <C-x> :q<CR>
map <Leader>rc :RunRubyFocusedContext<CR>
map <Leader>rf :RunRubyFocusedUnitTest<CR>
map <Leader>rl :RunLastRubyTest<CR>

" Hide search highlighting
map <Leader>h :set invhls <CR>
 
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
 
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
 
" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
 

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml
 
" No Help, please
nmap <F1> <Esc>
 
" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>
 
" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>
 
" Display extra whitespace
"set list listchars=tab:»·,trail:·
 
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb


" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif
 
" Numbers
set number
set numberwidth=5
 
" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"
 
" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full

set complete=.,t
 
" cases ignored unless uppercase character is given
set ignorecase
set smartcase

" keepmore context when scrolling off the end of a buffer
set scrolloff=3


" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
 
"snipmate setup
" try
"  source ~/.vim/snippets/support_functions.vim
" catch
"  source $HOMEPATH\vimfiles\snippets\support_functions.vim
" endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
 
    "if we're in a rails env then read in the rails snippets
    if filereadable("./config/environment.rb")
        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    endif
 
    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
endfunction
 
"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
 
 
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
 
"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction
 
" Set a nicer foldtext function
set foldtext=MyFoldText()
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

