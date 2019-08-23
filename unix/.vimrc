let mapleader = "\\"
set number relativenumber
set ruler
set incsearch
set hlsearch
" The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set tabstop=4       

set shiftwidth=4    " Indents with '>' will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab
filetype indent on
set cursorline
" shows keystrokes in normal mode
set showcmd
syntax enable
set autoindent


" for powerline setup in vim

"set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256
nnoremap <silent> <leader>l :nohl<CR><leader>l                  "<leader>l redraws the screen and removes any search highlighting.

" hilights current line
:hi CursorLine   cterm=bold "ctermbg=brown        
"set cursorcolumn
"set undofile " Maintain undo history between sessions
"set undodir=~/.vim/undodir

" copy paste from/to + clipboard simplified

"vnoremap <C-c> "+y
"map <C-p> "+p

" "to set indentation lines (no need to use if using plugin )
" set listchars=tab:\|\                       
" set list 
				
" shortcut for splitting screens/windows

map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-j> <C-w>j

" to map Enter, backspace with new line in normal mode

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

"set spell hilights color with red, but now it will underline
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=015      ctermbg=000

"UNIX commands/changes for mac (may/maynot work in linx)
vmap <C-c> "+y
map <C-p> "+p
set backspace=indent,eol,start

" plugins

" setup for pathogen plugin manager
execute pathogen#infect()

" lightline.vim

" for showing 2 status line (for lightline plugin)
set laststatus=2

" for not showing modes (eg: ----INSERT----) in status line 
set noshowmode

" NERDCommenter

filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" indentLine

" leading spaces will also be hilighted
let g:indentLine_leadingSpaceEnabled = 1

"show different indentation levels with different characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" set character for leading spaces. By default it is '˰'
let g:indentLine_leadingSpaceChar = '·'


let g:indentLine_color_term = 100

" for ctags
set tags=./tags;

" Ctrl+\ - Open the definition in a new tab
" Alt+] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" for cscope
cs add /Users/chinmayc/esp/cscope.out

" map F6 to build cscope and ctags for esp-idf ONLY and add in current file to update the line numbers when new lines are added
" map <F6> :!cd ~/esp/ && cscope -Rb<CR>:cs reset<CR><CR>:!cd ~/esp/esp-idf/ && ctags -R .<CR>:set tags=./tags;<CR><CR>

" if this fails with ctags, delete this and uncomment upper command
map <F6> :!cd ~/esp/ && cscope -Rb<CR>:cs reset<CR><CR>:!cd ~/esp/esp-idf/<CR><CR>

"cscope path to be relative
set cscoperelative

" If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
" will always use :cstag instead of the default :tag behavior.  Effectively,
" by setting 'cst', you will always search your cscope databases as well as
" your tag files.  The default is off.  Examples:
set cscopetag

" this will search cscope database first, then search tags database.
" setting this to 1 will search tags first then cscope
set csto=0
