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
syntax enable
set autoindent


" for powerline setup in vim

set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

"<leader>l redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><leader>l                  

:hi CursorLine   cterm=bold ctermbg=darkred        "hilights current line
set cursorcolumn

" To maintain undo history between sessions

"set undofile
"set undodir=~/.vim/undodir

" copy paste from/to + clipboard simplified

vmap <C-c> "+y
map <C-p> "+p

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

"putting the current line at various places on current screen
nnoremap zj zb
nnoremap zk zt

"searching visually selected block with '//'
vnoremap // y/<C-R>"<CR>

" tabs to spaces and spaces to tabs
nnoremap <leader>t :set expandtab!<cr> <bar> w<cr>
nnoremap <leader>nt :set expandtab<cr> <bar> w<cr>

" for showing 2 status line (for lightline plugin)
set laststatus=2
" for not showing modes (eg: ----INSERT----) in status line 
set noshowmode

" for ctags
set tags=./tags;

