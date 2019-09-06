let mapleader = "\\"
set nocompatible
set number relativenumber
set ruler
set incsearch
set hlsearch
syntax enable
set autoindent
" The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set tabstop=4       

set shiftwidth=4    " Indents with '>' will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab
filetype indent on

" set cursorline
set background=dark

" shows keystrokes in normal mode
set showcmd

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" features in vertical split
set fillchars+=vert:\|
hi vertsplit guifg=fg guibg=bg
hi StatusLine guibg=White guifg=Black

" open new vim tab
nnoremap <C-a> :tabnew<CR>

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
" */\c* */\C*
" When "\c" appears anywhere in the pattern, the whole pattern is handled like
" 'ignorecase' is on.  The actual value of 'ignorecase' and 'smartcase' is
" ignored.  "\C" does the opposite: Force matching case for the whole pattern.
set ignorecase
set smartcase

" words will not break at end of line
set linebreak
"
"<leader>l redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><leader>l

" setting vim to wrap after 120 characters. Lines will get formatted automatically. If set explicitly, select and use `gq` to format lines
set textwidth=80

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

" hilights current line
set cursorline
:hi cursorline cterm=bold ctermbg=black
" set cursorcolumn

" Maintain undo history between sessions
"set undofile 
"set undodir=~/.vim/undodir

" copy paste from/to + clipboard simplified

"vnoremap <C-c> "+y
"map <C-p> "+p

" This is required to hilight spedific parts like tab, space, eol. Specific parts can be set as done below 
set list

" setting line characters
set showbreak=↪\ 
set listchars=tab:→\ ,space:\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨"

" shortcut for splitting screens/windows

map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-j> <C-w>j

" Command 'F' (`:F`) will show full file path
:command F echo expand('%:p')

" to map Enter, backspace with new line in normal mode

nmap <CR> o<Esc>
nmap <BS> i<BS><ESC>l

" saving files, saving files with/without tabs
nnoremap <leader>wv :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
inoremap <leader>w <esc>:w<CR>

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

" go to vim next tab with gl
nnoremap gl gt

"searching visually selected block with '//'
vnoremap // y/<C-R>"<CR>

"set spell hilights color with red, but now it will underline
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=015      ctermbg=000

" :help "norestorescreen"
" For non-Windows Vim: You can set or reset the 't_ti' and 't_te'
" options in your .vimrc.  To disable restoring:
    " set t_ti= t_te=
" To enable restoring (for an xterm):
    set t_ti=7[r[?47h t_te=[?47l8
" (Where  is an <Esc>, type CTRL-V <Esc> to insert it)

" -----------------------------------------------------------

"UNIX commands/changes (may/maynot work in linx)
vmap <C-c> "+y
map <C-p> "+p
set backspace=indent,eol,start

" -----------------------------------------------------------

" plugins

" setup for pathogen plugin manager
execute pathogen#infect()

" #########

" set downloaded colorscheme via plugin

" rigel (https://github.com/Rigellute/rigel)
" colorscheme rigel

" solarized (https://github.com/altercation/vim-colors-solarized)
let g:solarized_termtrans=1
colorscheme solarized

" #########

" cscope_dynamic
"
nmap <F10> <Plug>CscopeDBInit
" g:cscopedb_big_file="~/esp/cscope.out"
" g:cscopedb_small_file="~/esp/cscope_small.db"
" g:cscopedb_auto_init=1

" vim-surround
" (https://vimawesome.com/plugin/surround-vim)
" useful in modifying surrounding parameters like "", '', <>, {}, ()m etc
"
" #########
"
" NERDCommenter

filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" #########

" indentLine

" leading spaces will also be hilighted
let g:indentLine_leadingSpaceEnabled = 1

"show different indentation levels with different characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" set character for leading spaces. By default it is '˰'
let g:indentLine_leadingSpaceChar = '·'

let g:indentLine_color_term = 100

" #########

" lightline.vim
" (https://github.com/itchyny/lightline.vim)

" for showing 2 status line (for lightline plugin)
set laststatus=2

" for not showing modes (eg: -- INSERT --) in status line 
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \ 'filename': '%F',
      \ 'charvaluehex': '0x%B'
      \ }
      \ }

" #########

" for ctags
" set tags=./tags;

" #########

" for cscope
cs add /Users/chinmayc/esp/esp-idf/cscope.out
cs add /Users/chinmayc/esp/esp-alexa/cscope.out
cs add /Users/chinmayc/esp/esp-jumpstart/cscope.out
cs add /Users/chinmayc/esp/smart-home/cscope.out
cs add /Users/chinmayc/esp/esp-audio-sdk/cscope.out

let $CSCOPE_EDITOR="Vim"

" map F6 to build cscope and ctags for esp-idf ONLY and add in current file to update the line numbers when new lines are added
" map <F6> :!cd ~/esp/ && cscope -Rb<CR>:cs reset<CR><CR>:!cd ~/esp/esp-idf/ && ctags -R .<CR>:set tags=./tags;<CR><CR>

" if this fails with ctags, delete this and uncomment upper command
map <F6> :!cd ~/esp/esp-idf && cscope -Rb<CR>:cs reset<CR><CR>:!cd ~/esp/esp-idf/<CR><CR>

"cscope path to be relative
set cscoperelative

" If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
" will always use :cstag instead of the default :tag behavior.  Effectively,
" by setting 'cst', you will always search your cscope databases as well as
" your tag files.  The default is off.  Examples:
set cscopetag

" this will search cscope database first, then search tags database.
" setting this to 1 will search tags first then cscope
set csto=1
