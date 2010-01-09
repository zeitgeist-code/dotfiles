call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))

" appearance
colorscheme custom
set guifont=Inconsolata:h18 "Envy_Code_R:h16

syntax on            " syntax highlighting on
set columns=999      " max columns
set lines=999        " max lines 
set number           " show line numbers
set cursorline       " highlight cursorline

set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set showmode         " show current mode down to bottom
set hlsearch

set laststatus=2     " Always display the status line
set scrolloff=3      " keepmore context when scrolling off the end of a buffer 
set visualbell       " no beep

set fillchars=""     " no characters in window seperators
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-40(%3l,%02c%03V%)%O'%02b'

set guioptions-=T    " no toolbar 
set guioptions-=L    " no scrollbars
set guioptions-=r

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

" Hide the mouse pointer while typing
"set mousehide
" mappings
set splitright
set splitbelow

let mapleader=","    " set leader to ','

" set text wrapping toggles
nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>
" Toggle highlight search
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" edit vim configuration
map <Leader>vr :e ~/.vimrc<CR>   
map <Leader>gvr :e ~/.gvimrc<CR>
au! BufWritePost .vimrc source % " Reload .vimrc after each write

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

"Vertical split then hop to new buffer
noremap <leader>v :vsp<CR>
noremap <leader>h :split<CR>

"Make current window the only one
noremap <leader>o :only<CR>

" Maps autocomplete to ctrl-space
imap <C-Space> <C-N>

" Set ctrl-a and ctrl-e to jump to beginning and end of line respectively
imap <C-a> <C-o>^
imap <C-e> <C-o>$
nmap <C-a> ^
nmap <C-e> $

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
set foldlevel=22
set foldnestmax=2
set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '

" indent file
map <Leader>i gg=G

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
 
" Inserts the path of the currently edited file into a command
map <Leader>. :cd <C-R>=expand("%:p:h")  <Enter>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

 
" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" When hitting <;>, complete a snippet if there is one; else, insert an actual
" <;>
function! InsertSnippetWrapper()
    let inserted = TriggerSnippet()
    if inserted == "\<tab>"
        return ";"
    else
        return inserted
    endif
endfunction
inoremap ; <c-r>=InsertSnippetWrapper()<cr>
 
 
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

"autocmd FileType ruby runtime ruby_mappings.vim

" == ruby == " == ruby == 
" cmd-r will run the given file
imap <D-r> <ESC><D-r>
nmap <D-r> :!ruby %<CR>

" ruby focused unit test
map <Leader>m :RunAllRubyTests<CR>

map <leader>l :call RunTestsForFile('')<cr>:redraw<cr>:call JumpToError()<cr>
map <C-x> :q<CR>
map <Leader>rc :RunRubyFocusedContext<CR>
map <Leader>rf :RunRubyFocusedUnitTest<CR>
map <Leader>rl :RunLastRubyTest<CR>

