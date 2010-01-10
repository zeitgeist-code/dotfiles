
" == ruby == " == ruby == 
" cmd-r will run the given file
imap <D-r> <ESC><D-r>
imap () ()<LEFT>
imap [] []<LEFT>
imap {} {}<LEFT>
imap <> <><LEFT>
nmap <D-r> :!ruby %<CR>

" ruby focused unit test
map <Leader>m :RunAllRubyTests<CR>

map <leader>l :call RunTestsForFile('')<cr>:redraw<cr>:call JumpToError()<cr>
map <Leader>rc :RunRubyFocusedContext<CR>
map <Leader>rf :RunRubyFocusedUnitTest<CR>
map <Leader>rl :RunLastRubyTest<CR>

