function! Fill_column(col) abort
  let &colorcolumn=join(range(a:col,999),',')
endfunction

function! myinit#before() abort 
  setlocal conceallevel=0
  call ToggleConceal()
endfunction


function! myinit#after() abort 

  " Unsetting SpaceVim stuff
  setlocal conceallevel=0
  let g:indentLine_conceallevel = 0
  call Fill_column(80)

  "Custom configuration
  map zi :set invpaste<ENTER>
  "Toggle buffers  with \-right (next) and \-left (previous)
  nmap  <Leader><Right> :bnext <CR>
  nmap <Leader><Left> :bprevious <CR>
 
  "Syntastic
  "See documentation in:: 
  "https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
  "------------------------------------------------------
  "set statusline+=%#warningmsg#
  "set statusline+=%{SyntasticStatuslineFlag()}
  "set statusline+=%*
  
  " Update location list automatically
  let g:syntastic_always_populate_loc_list = 1
    
  " Opens and/or closes automatically the error list: 
  "  0: error window will neither be opened nor closed
  "  1: error window will be automatically opened when errors are
  "     detected, and closed when none are detected 
  "  2: error window will be automatically closed when no errors are
  "     detected, but not opened automatically.
  "  3: error window will be automatically opened when errors are
  "     detected, but not closed automatically 
  let g:syntastic_auto_loc_list = 0
  
  " Check syntax when opening the file 
  let g:syntastic_check_on_open = 1
  
  " Check syntax at closing or not
  let g:syntastic_check_on_wq = 0
  
  " if set to one, debugging messages will be added to vim messages history. 
  " you can see tem with :mes
  let g:syntastic_debug = 0
  
  " List of messages you do not want to appear
  let g:syntastic_quiet_messages = { 'regex': '#ifndef header guard has wrong style\|#endif line should be\|Include the directory when naming .h files\|file not found\|Complex multi-line \/*...*\/-style comment found. Lint may give bogus warnings.\|is deprecated'}
  
  
  
  " Specific checkers by programming language
  " C++
  let g:syntastic_cpp_compiler = "g++"
  "let g:syntastic_cpp_checkers= ["make","cpplint","clang_check"]
  let g:syntastic_cpp_include_dirs = ["include","headers","includes"]
  let g:syntastic_cpp_compiler_options = "-Wall -Wextra -Wpedantic -std=c++11"
  
  " Other options
  "let g:syntastic_cpp_check_header = 1 
  "let g:syntastic_cpp_cpplint_thres = 3
  "let g:syntastic_cpp_cpplint_exec = 'cpplint'
  "let g:syntastic_cpp_cpplint_post_args = ""
  
  
  " C
  let g:syntastic_c_compiler = "gcc"
  let g:syntastic_c_ckeckers = ["make","gcc","clang_check"] 
  let g:syntastic_c_compiler_options = "-Wall -Wextra -Wpedantic -std=c11"
  let g:syntastic_c_include_dirs = ["include","headers","includes","../include", "../../include"]
  
  "let g:syntastic_c_ckeckers = ["make","gcc","splint","cpplint"] 
  "let g:syntastic_c_cpplint_exec = 'cpplint'
  "let g:syntastic_c_no_include_search = 0
  "let g:syntastic_c_check_header = 1
  
  SyntasticCheck
endfunction

