let mapleader = "\\"
set number relativenumber
set ruler
set incsearch
set hlsearch
set tabstop=4       " The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.

set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
filetype indent on
set cursorline
set showcmd
"colorscheme Mogao
syntax on
set autoindent


" for powerline setup in vim

"set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256
nnoremap <silent> <leader>l :nohl<CR><leader>l                  "<leader>l redraws the screen and removes any search highlighting.

" hilights current line
:hi CursorLine   cterm=bold "ctermbg=black        
"set cursorcolumn
"set undofile " Maintain undo history between sessions
"set undodir=~/.vim/undodir

" copy paste from/to + clipboard simplified

"vnoremap <C-c> "+y
"map <C-p> "+p

"to set indentation lines

set listchars=tab:\|\  
set list 

" shortcut for splitting screens/windows

map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-j> <C-w>j

" to map Enter, backpsace with new line in normal mode

nmap <CR> o<Esc>
nmap <BS> i<BS><ESC>l

" saving files, saving files with/without tabs
nnoremap <leader>wv :source $MYVIMRC<CR>        
nnoremap <leader>w :w<cr> 
inoremap <leader>w <esc>:w<cr>


"setting timeout for esc key as 0
set timeoutlen=1000 ttimeoutlen=0

" set scrolling with cursor in middle
set so=4 "short for set scrolloff=999  also zk/zj won't work in this mode. use ':set so=0' to exit this mode

" tabs to spaces and spaces to tabs
nnoremap <leader>t :set expandtab!<cr> <bar> w<cr>
nnoremap <leader>nt :set expandtab<cr> <bar> w<cr>

"putting the current line at various places on current screen
nnoremap zj zb
nnoremap zk zt

"searching visually selected block with '//'
vnoremap // y/<C-R>"<CR>

"UNIX commands/changes for mac (may/maynot work in linx)
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set backspace=indent,eol,start

" plugins

" setup for pathogen plugin manager
execute pathogen#infect()

set laststatus=2

" for ctags
set tags=./tags;

" for cscope
cs add /Users/chinmayc/esp/esp-idf/cscope.out

"cscope path to be relative
set cscoperelative

set cscopetag
set cst
set csto=0
cs add cscope.out

let g:NERDSpaceDelims = 1

