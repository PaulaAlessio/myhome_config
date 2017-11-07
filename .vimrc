"+-----------------------------------------------------+
"|                    PLUG-INS                         |
"+-----------------------------------------------------+

" Initialize plugin system 
call plug#begin('~/.vim/plugged') 

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Devicons for NERDTree
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting 
Plug 'vim-syntastic/syntastic' 

" Deoplete 
"Plug 'Shougo/deoplete.nvim'

call plug#end()


"+-----------------------------------------------------+
"|                      BASICS                         |
"+-----------------------------------------------------+

" enable syntax highlighting
syntax on

" enable line numbers
se nu

" enable mouse support
"set mouse=a"

" show col position 
set statusline+=col:\ %c

" syntax folding 
set foldmethod=syntax
let r_syntax_folding = 1 

" Color scheme
colorscheme koehler

" Enconding utf8
set encoding=utf8

" Create no back up files 
set nobackup 
set nowritebackup

" These are the basic settings to get the font to work (required):
set guifont="Fura Mono Regular for Powerline Plus Nerd File Types"

" Set color column in column 80"
set colorcolumn=80

"+-----------------------------------------------------+
"|                  INDENTATION                        |
"+-----------------------------------------------------+
" Paste without introducing new indentation
map zi :set invpaste<ENTER>

filetype indent plugin on
set shiftwidth=3
set softtabstop=3
set expandtab
set diffopt+=iwhite
set diffexpr=""
set hlsearch
let fortran_free_source=1
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

"+-----------------------------------------------------+
"|                  PLUGIN SETTINGS                    |
"+-----------------------------------------------------+

"      NERDTree
"----------------------------
" open NERDTree on vim startup
autocmd vimenter * NERDTree

" Use deoplete on startup. 
"let g:deoplete#enable_at_startup = 1 autocmd
"InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif 


"      Syntastic
"----------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0

let g:syntastic_quiet_messages = { 'regex': '#ifndef header guard has wrong style\|#endif line should be\|Include the directory when naming .h files\|file not found\|Complex multi-line \/*...*\/-style comment found. Lint may give bogus warnings.'}


" C++
let g:syntastic_cpp_checkers= ["make","cpplint","clang_check"]
let g:syntastic_cpp_include_dirs = ["include","headers","includes"]
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_cpplint_post_args = ""
let g:syntastic_cpp_compiler_options = "-Wall"
let g:syntastic_cpp_check_header = 1 
let g:syntastic_cpp_cpplint_thres = 3


" C
"let g:syntastic_c_ckeckers = ["make","gcc","splint","cpplint"] 
"let g:syntastic_c_ckeckers = ["make","gcc"] 
"let g:syntastic_c_cpplint_exec = 'cpplint'
let g:syntastic_c_compiler_options = "-Wall"
let g:syntastic_c_include_dirs =["include","headers","includes", "src"]
let g:syntastic_c_no_include_search = 0
let g:syntastic_c_check_header = 1
 



"+-----------------------------------------------------+
"|                   KEY MAPPINGS                      |
"+-----------------------------------------------------+

"toggle NERDTree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR>

