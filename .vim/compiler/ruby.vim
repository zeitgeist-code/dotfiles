map <leader>m :call RunTestsForFile('')<cr>:redraw<cr>:call JumpToError()<cr>

function! RunTests(target, args)
    silent ! echo
    exec 'silent ! echo -e "\033[1;36mRunning tests in ' . a:target . '\033[0m"'
    "set makeprg=spec\ --require\ make_output_formatter\ --format\ Spec::Runner::Formatter::MakeOutputFormatter
    silent w
    exec "make " . a:target . " " . a:args
endfunction

function! RunTestsForFile(args)
    if @% =~ '_spec'
        call RunTests('%', a:args)
    else
        let test_file_name = TestModuleForCurrentFile()
        call RunTests(test_file_name, a:args)
    endif
endfunction

function! JumpToError()
    if getqflist() != []
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        " silent cc!
        " how is sbuffer useful? - using set switchbuf=useopen, that's how
        " why is this necessary? it does this automatically?
        exec ":sbuffer " . error['bufnr']
        call RedBar()
        echo error_message
    else
        call GreenBar()
        echo "All tests passed"
    endif
endfunction

function! RedBar()
    hi RedBar ctermfg=white ctermbg=red guibg=red
    echohl RedBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! GreenBar()
    hi GreenBar ctermfg=white ctermbg=green guibg=green
    echohl GreenBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! ModuleTestPath()
    let file_path = @%
    let components = split(file_path, '/')
    let path_without_extension = substitute(file_path, '\.rb$', '', '')
    let test_path = 'spec/' . path_without_extension . '_spec.rb'
    return test_path
endfunction

function! TestModuleForCurrentFile()
    let test_path = ModuleTestPath()
    echo test_path
    let test_module = substitute(test_path, '/', '.', 'g')
    return test_path
endfunction
