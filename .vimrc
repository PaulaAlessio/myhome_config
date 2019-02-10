"+-----------------------------------------------------+
"+.vimrc configuration file, working on VIM 8 compiled +
"+ with flags:                                         +
"+  ./configure                                        + 
"+    --prefix=/usr/local/ --enable-python3interp=yes  +
"+    --enable-rubyinterp=yes --enable-perlinterp=yes  +
"+    --enable-multibyte --enable-cscope               +
"+    --with-x --with-gnome                            +
"+-----------------------------------------------------+


"+---------------------------------------------------------------------+
"+ In order for plug ins to be installed, you need to download         +
"+ plug.vim. Steps:                                                    +
"+ mkdir -p ~/.vim/autoload;                                           +
"+ curl -fLo ~/.vim/autoload/plug.vim \                                +
"+ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim +
"+---------------------------------------------------------------------+

"+---------------------------------------------------------------------+
" Download molokai colorscheme from                                    +
" https://github.com/tomasr/molokai                                    +
"+---------------------------------------------------------------------+

"+-----------------------------------------------------+
"|                    PLUG-INS                         |
"+-----------------------------------------------------+

"Initialize plugin system 
call plug#begin('~/.vim/plugged') 
"
"A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

"Devicons for NERDTree
Plug 'ryanoasis/vim-devicons'

"Syntax highlighting warnings errors
Plug 'vim-syntastic/syntastic' 

"Tagbar 
Plug 'majutsushi/tagbar'

"Autocompletion
"Plug 'Rip-Rip/clang_complete'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Supertab qu'e hace? 
Plug 'ervandew/supertab'

"Beautify and tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()


"+-----------------------------------------------------+
"|                      BASICS                         |
"+-----------------------------------------------------+

" enable syntax highlighting
syntax on

" enable line numbers
se nu

" enable mouse support
set mouse=a

" show col position 
set statusline+=col:\ %c

" syntax folding 
set foldmethod=syntax
let r_syntax_folding = 1 
set foldlevel=0

" Color scheme
colorscheme molokai

" Enconding utf8
set encoding=utf8

" Create no back up files 
set nobackup 
set nowritebackup

" Strip all trailing white spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" These are the basic settings to get the font to work (required):
"set guifont="Fura Mono Regular for Powerline Plus Nerd File Types"
set guifont="InconsolataGo Nerd Font"

" Set color column in column 80"
set colorcolumn=81
set t_Co=256
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
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to always 
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

"Airline 
"------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
set laststatus=2


"Syntastic
"See documentation in:: 
"https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
"------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

" Check syntaxis when opening the file 
let g:syntastic_check_on_open = 1

" Check syntaxis at closing or not
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
let g:syntastic_cpp_include_dirs = ["include",
      \"headers",
      \"includes"]
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
let g:syntastic_c_include_dirs = ["include",
      \"headers",
      \"includes",
      \"../include",
      \"../../include"]

"let g:syntastic_c_ckeckers = ["make","gcc","splint","cpplint"] 
"let g:syntastic_c_cpplint_exec = 'cpplint'
"let g:syntastic_c_no_include_search = 0
"let g:syntastic_c_check_header = 1
 

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
nmap <Leader><Left> :bprevious <CR>

