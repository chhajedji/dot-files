let mapleader = "\\"


" all set commands

" required for Vundle
filetype off
set nocompatible

set number relativenumber
set ruler
set incsearch
set hlsearch
set autoindent

" The width of a TAB is set to 4.  Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
set tabstop=4       

" Indents with '>' will have a width of 4.
set shiftwidth=4

" Sets the number of columns for a TAB.
set softtabstop=4

" no tabs, but spaces!
set expandtab

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

" Enable use of the mouse for all modes to disable this, use `set mouse-=a`
" set mouse=a

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
" set cmdheight=2

" features in vertical split
set fillchars+=vert:\┊

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

" setting vim to wrap after 120 characters. Lines will get formatted
" automatically. If set explicitly, select and use `gq` to format lines
set wrap
set textwidth=80

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

" hilights current line
" set cursorline
" set cursorcolumn

" Maintain undo history between sessions
"set undofile 
"set undodir=~/.vim/undodir

" This is required to hilight spedific parts like tab, space, eol. Specific parts can be set as done below 
set list

" setting line characters
set showbreak=↪\ 
set listchars=tab:→\ ,space:\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨"
" set listchars=tab:\┆\ ,space:\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨"

" :help "norestorescreen"
" For non-Windows Vim: You can set or reset the 't_ti' and 't_te'
" options in your .vimrc.  To disable restoring:
    " set t_ti= t_te=
" To enable restoring (for an xterm):
    set t_ti=7[r[?47h t_te=[?47l8
" (Where  is an <Esc>, type CTRL-V <Esc> to insert it)

"setting timeout for esc key as 0
set timeoutlen=1000 ttimeoutlen=0

" set scrolling with cursor in middle
"short for set scrolloff=999  also zk/zj won't work in this mode. use ':set so=0' to exit this mode
set so=4

" `set spell` hilights color with red, but now it will underline
" set spell
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=015      ctermbg=000

" hilighting options in vsplit and gui
hi vertsplit guifg=fg guibg=bg
hi StatusLine guibg=White guifg=Black

hi cursorline cterm=bold ctermbg=black

" Changes colors for current line and relativenumbers. After this current line
" is in yellow and relative lines are in Grey (maybe DarkGrey). Colorscheme may
" overwrite this.
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color setting for visually selected text.
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

filetype indent on
syntax enable

" open new vim tab
nnoremap <C-a> :tabnew<CR>
"
"<leader>l redraws the screen and removes any search highlighting.
" nnoremap <silent> <leader>l :nohl<CR><leader>l
nnoremap <silent> <leader>l :nohl<CR>

" copy paste from/to + clipboard simplified
vnoremap <C-c> "+y
nnoremap <C-p> "+p

" shortcut for splitting screens/windows
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
" noremap <C-o> <C-w>o
" noremap <C-s> <C-w>s
" noremap <C-v> <C-w>v

" copy file name to + clipboard (system clipboard)
nmap ,cs :let @+=expand("%")<CR>
" copy file path to + clipboard (system clipboard)
nmap ,cp :let @+=expand("%:p")<CR>

" Command 'F' (`:F`) will show full file path
command F echo expand('%:p')

" Command `PI` will install vim plugins with Vundle
command PI PluginInstall

command EV e ~/.vimrc

" To map Enter, backspace with new line in normal mode. Not a good idea to map
" Enter key as it is used to cycle results in `grep`/`vimgrep`.
" nmap <CR> o<Esc>
nmap <BS> i<BS><ESC>l

" saving files, saving files with/without tabs
nnoremap <leader>wv :cs kill -1<CR><CR>:source $MYVIMRC<CR>:!source ~/.bashrc<CR><CR>
nnoremap <leader>w :w<CR>
inoremap <leader>w <esc>:w<CR>

" tabs to spaces and spaces to tabs
nnoremap <leader>t :set expandtab!<cr> <bar> w<cr>
nnoremap <leader>nt :set expandtab<cr> <bar> w<cr>

"putting the current line at various places on current screen
nnoremap zj zb
nnoremap zk zt

" go to vim next tab with gl and previous with gL
nnoremap gl gt
nnoremap gL gT

"searching visually selected block with '//'
vnoremap // y/<C-R>"<CR>

" Cycle through grep results
nnoremap <silent> <leader>f :cn<CR>zv
nnoremap <silent> <leader>b :cp<CR>zv

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" setup for Vundle Plugin manager
"
" set the runtime path to include Vundle and initialize"
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'tpope/vim-fugitive'
Plugin 'erig0/cscope_dynamic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'gnattishness/cscope_maps'
" Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
" Plugin 'hari-rangarajan/cctree'
" Plugin 'vim-scripts/taglist.vim'
" Plugin 'severin-lemaignan/vim-minimap'
Plugin 'sheerun/vim-polyglot'

" Some good colorschemes
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'Rigellute/rigel'
" Plugin 'joshdick/onedark.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ####################################

" colorscheme
"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" colorscheme rigel

" let g:onedark_hide_endofbuffer=1
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
" colorscheme onedark

" make comments italic. Be sure to put this after setting colorscheme so that
" colorscheme doesn't override this setting
hi Comment cterm=italic gui=italic

" ####################################

" cscope_dynamic
"
" nmap <F10> <Plug>CscopeDBInit
" g:cscopedb_big_file="~/esp/cscope.out"
" g:cscopedb_small_file="~/esp/cscope_small.db"
" g:cscopedb_auto_init=1

" vim-surround
" (https://vimawesome.com/plugin/surround-vim)
" useful in modifying surrounding parameters like "", '', <>, {}, ()m etc
"
" ####################################
"
" NERDCommenter

filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ####################################

" indentLine

" leading spaces will also be hilighted
let g:indentLine_leadingSpaceEnabled = 1

"show different indentation levels with different characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" set character for leading spaces. By default it is '˰'
let g:indentLine_leadingSpaceChar = '·'

let g:indentLine_color_term = 100

" ####################################

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

" ####################################

" ctags
" set tags=./tags;

" ####################################

" confirm-quit


" ####################################

" cscope
cs add /home/chinmay/esp/esp-idf/cscope.out
cs add /home/chinmay/esp/esp-alexa/cscope.out
cs add /home/chinmay/esp/esp-jumpstart/cscope.out
" cs add /home/chinmay/esp/smart-home/cscope.out
cs add /home/chinmay/esp/esp-audio-sdk/cscope.out
cs add /home/chinmay/esp/esp-azure/cscope.out

let $CSCOPE_EDITOR="Vim"

" Map F6 to build cscope and ctags for esp-idf ONLY and add in current file to
" update the line numbers when new lines are added
" noremap <F6> :!cd ~/esp/ && cscope -Rb<CR>:cs reset<CR><CR>:!cd ~/esp/esp-idf/ && ctags -R .<CR>:set tags=./tags;<CR><CR>

" if this fails with ctags, delete this and uncomment upper command
noremap <F6> :!cd ~/esp/esp-idf && cscope -Rb<CR>:cs reset<CR><CR>
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

" set syntax for every `.espconfig` file
au BufNewFile,BufRead .espconfig call dist#ft#SetFileTypeSH("bash")


" ####################################

" minimap

let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
