set nocompatible

" History of commands
set history=500

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
filetype plugin indent on

filetype plugin on
filetype indent on

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set to auto read when a file is changed from the outside
set autoread

" ### Encoding
set encoding=utf-8
lang en_US.UTF-8
set termencoding=utf-8
set fileencodings=utf-8,iso-8859-2

" ### Color scheme
set t_Co=256
colorscheme desert

" ### Settings
set backspace=indent,eol,start
set scrolloff=3
set directory=/tmp
set nobackup
set noswapfile
set nowb
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set splitbelow

" Linebreak on 120 characters
set lbr
set tw=120

" Indenting & wraping
" set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Show the cursor position all the time
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" Display incomplete commands
set showcmd

" Highlight search results
set hlsearch

" Do incremental searching
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Always display the status line
set laststatus=2

" Case only matters with mixed case expressions
set ignorecase
set smartcase

" Tab completion options
set completeopt=longest,menu
set wildmode=list:longest,list:full

" Display extra whitespace
set list listchars=tab:»·,trail:·

syntax on
autocmd BufReadPost *.es6 set syntax=javascript
autocmd BufNewFile,BufRead *.es6 setfiletype javascript

" ### Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts = 1
let g:airline_section_c = "%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
let g:airline_section_b = ""

" ### Mappings
let mapleader = ","
map <Leader>q :q!<cr>

" No Help, please
nmap <F1> <Esc>

" TODO Ident lines of file

" Re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.coffee :call DeleteTrailingWS()
