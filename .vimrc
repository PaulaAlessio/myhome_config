"+-----------------------------------------------------+
"+.vimrc configuration file, working on VIM 8 compiled +
"+ with flags:                                         +
"+  ./configure                                        + 
"+    --prefix=/usr/local/ --enable-python3interp=yes  +
"+    --enable-rubyinterp=yes --enable-perlinterp=yes  +
"+    --enable-multibyte --enable-cscope               +
"+    --with-x --with-gnome                            +
"+-----------------------------------------------------+



"+-----------------------------------------------------+
"|                    PLUG-INS                         |
"+-----------------------------------------------------+

"Initialize plugin system 
call plug#begin('~/.vim/plugged') 

"A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

"Devicons for NERDTree
Plug 'ryanoasis/vim-devicons'

"Syntax highlighting warnings errors
Plug 'vim-syntastic/syntastic' 

"Tagbar 
Plug 'majutsushi/tagbar'

"Autocompletion
Plug 'Rip-Rip/clang_complete'
Plug 'ervandew/supertab'

"Beautify and tabs
Plug 'vim-airline/vim-airline'


call plug#end()


"+-----------------------------------------------------+
"|                      BASICS                         |
"+-----------------------------------------------------+

" enable syntax highlighting
syntax on

" enable line numbers
se nu

" enable mouse support
set mouse=a"

" show col position 
set statusline+=col:\ %c

" syntax folding 
set foldmethod=syntax
let r_syntax_folding = 1 
set foldlevel=0

" Color scheme
colorscheme koehler

" Enconding utf8
set encoding=utf8

" Create no back up files 
set nobackup 
set nowritebackup

" Strip all trailing white spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" These are the basic settings to get the font to work (required):
"set guifont="Fura Mono Regular for Powerline Plus Nerd File Types"
"set guifont="Inconsolata"

" Set color column in column 80"
set colorcolumn=81

"+-----------------------------------------------------+
"|                  INDENTATION                        |
"+-----------------------------------------------------+
" Paste without introducing new indentation
map zi :set invpaste<ENTER>
filetype indent plugin on
set shiftwidth=2
set backspace=2
set softtabstop=2
set expandtab
set diffopt+=iwhite
set diffexpr=""
set hlsearch
let fortran_free_source=1
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

"+-----------------------------------------------------+
"|                  PLUGIN SETTINGS                    |
"+-----------------------------------------------------+
"NERDTree
"------------------------------------------------------
"open NERDTree on vim startup
"autocmd vimenter * NERDTree

"Autocomplete
"-------------------------------------------------------
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
" Complete options: show pop up menu 
set completeopt=menu,menuone
" Limit popup menu height
set pumheight=15
" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

"Airline 
"------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
set laststatus=2

"Syntastic
"------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0
let g:syntastic_quiet_messages = { 'regex': '#ifndef header guard has wrong style\|#endif line should be\|Include the directory when naming .h files\|file not found\|Complex multi-line \/*...*\/-style comment found. Lint may give bogus warnings.\|is deprecated'}


" C++
let g:syntastic_cpp_checkers= ["make","cpplint","clang_check"]
let g:syntastic_cpp_include_dirs = ["include",
      \"headers",
      \"includes",
      \"/home/pep04706/Documents/work/EPICS/base-3.16.1/include"]
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_cpplint_post_args = ""
let g:syntastic_cpp_compiler_options = "-Wall -Wextra"
let g:syntastic_cpp_check_header = 1 
let g:syntastic_cpp_cpplint_thres = 3


" C
let g:syntastic_c_ckeckers = ["make","gcc","clang_check"] 
"let g:syntastic_c_ckeckers = ["make","gcc","splint","cpplint"] 
"let g:syntastic_c_cpplint_exec = 'cpplint'
let g:syntastic_c_compiler_options = "-Wall -Wextra"
let g:syntastic_c_include_dirs = ["include",
      \"headers",
      \"includes",
      \"../include",
      \"../../include",
      \"src","/home/pep04706/Documents/work/EPICS/base-3.16.1/include", 
      \"/home/pep04706/Documents/work/EPICS/base-3.16.1/include/os/Linux/", 
      \"/home/pep04706/Documents/work/EPICS/base-3.16.1/include/compiler/gcc", 
      \"/home/pep04706/Documents/work/EPICS/base-3.16.1/include/valgrind"]
let g:syntastic_c_no_include_search = 0
let g:syntastic_c_check_header = 1
 

"      TagBar
"------------------------------------------------------
"Open TagBar when opening C, C++ files 
au BufRead,BufNewFile  *.c,*.cc,*.h,*.hpp,*.cpp     Tagbar


"+-----------------------------------------------------+
"|                   KEY MAPPINGS                      |
"+-----------------------------------------------------+

"Toggle NERDTree view with CTRL-n
nmap <silent> <C-n> :NERDTreeToggle<CR>

"Toggle Tagbar view with CTRL-b
nmap <silent> <C-b> :Tagbar<CR>

"Toggle buffers  with \-right (next) and \-left (previous)
nmap  <Leader><Right> :bnext <CR>
nmap  <Leader><Left>  :bprevious <CR>
