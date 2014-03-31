if exists("b:pythonrun")
    finish
endif
let b:pythonrun = 1

if !hasmapto('<Plug>PythonRun')
    map <buffer> <unique> <F8> <Plug>PythonRun
endif
noremap <buffer> <Plug>PythonRun :!/usr/bin/env python %<cr>
