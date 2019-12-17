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

" The width of a TAB is set to 4.  Still it is a \t. It is just that Vim will
" interpret it to be having a width of 4. While using tabs, use `tabstop` and
" not `softtabstop` (leave it unset). While using spaces instead of tabs, use
" `softtabstop` and not `tabstop`(unset).
" set tabstop=4

" Indents with '>' will have a width of 4.
set shiftwidth=4

" Sets the number of columns for a TAB.
set softtabstop=4

" no tabs, but spaces!
set expandtab

" Indentation with mixed tabs and spaces.
" These settings will cause as many hard tabs as possible being used for
" indentation, and spaces will be used to fill in the remains. The idea is to set
" `shiftwidth` and `softtabstop` to the same value, leave `expandtab` at its
" default ('noexpandtab'). Usually, tabstop is left at its default value:
" set shiftwidth=4
" set softtabstop=4

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
" set fillchars+=vert:\┊

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
set textwidth=100

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

" highlights current line
" set cursorline
set nocursorline
" set cursorcolumn

" Maintain undo history between sessions
"set undofile 
"set undodir=$HOME/.vim/undodir

" This is required to highlight spedific parts like tab, space, eol. Specific parts can be set as done below 
set list

" setting line characters
set showbreak=↪\ 
set listchars=tab:→\ ,space:\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨"
" set listchars=tab:\┆\ ,space:\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨"

" When a bracket is inserted, briefly jump to the matching one.  The
" jump is only done if the match can be seen on the screen.  The time to
" show the match can be set with 'matchtime'.
set showmatch
set matchtime=3

" :help "norestorescreen"
" For non-Windows Vim: You can set or reset the 't_ti' and 't_te'
" options in your .vimrc.  To disable restoring:
    " set t_ti= t_te=
" To enable restoring (for an xterm):
    " set t_ti=7[r[?47h t_te=[?47l8
" (Where  is an <Esc>, type CTRL-V <Esc> to insert it)


" When on, splitting a window will put the new window right of the
" current one.
set splitright
" set splitbelow

"setting timeout for esc key as 0
set timeoutlen=1000 ttimeoutlen=0

" set scrolling with cursor in middle
"short for set scrolloff=999  also zk/zj won't work in this mode. use ':set so=0' to exit this mode
set so=4

" `set spell` highlights color with red, but now it will underline
set nospell
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=015      ctermbg=000

" Set the directory where the swap files are stored, so they don't clutter  normal directories.
set swapfile
set dir=$HOME/.tmp/

" URxvt requires these settings to render color in vim properly for some reason!
set notermguicolors
set t_Co=256

" highlighting options in vsplit and gui
hi vertsplit guifg=fg guibg=bg
hi StatusLine guibg=White guifg=Black

" Set color for keys mentioned in `listchars`
" hi SpecialKey ctermfg=darkgrey guifg=grey70

hi cursorline cterm=bold ctermbg=black

" Changes colors for current line number and relativenumbers. After this,
" current line number is in yellow (by default which is changed with
" `CursorLineNr`) and relative lines are in Grey (maybe DarkGrey). Colorscheme
" may overwrite this.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr cterm=Bold,Italic ctermbg=Black ctermfg=Yellow gui=NONE guibg=#444444 guifg=#ffff00

" Matching braces color.
hi MatchParen cterm=none ctermbg=Green ctermfg=Black

" Color setting for visually selected text.
highlight Visual cterm=NONE ctermbg=Darkgrey ctermfg=NONE guibg=Grey40

filetype indent on
syntax enable

"
"<leader>l redraws the screen and removes any search highlighting.
" nnoremap <silent> <leader>l :nohl<CR><leader>l
nnoremap <silent> <leader>l :nohl<CR>

" copy paste from/to + clipboard simplified
vnoremap <C-c> "+y
nnoremap <C-c> V"+y
nnoremap <C-p> "+p
vnoremap <C-p> xh"+p

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
command! F echo expand('%:p')

" Command `PI` will install vim plugins with Vundle
command! PI PluginInstall

command! EV e + $HOME/.vimrc

" To map Enter, backspace with new line in normal mode. Not a good idea to map
" Enter key as it is used to cycle results in `grep`/`vimgrep`.
" nmap <CR> o<Esc>
nmap <BS> i<BS><ESC>l

" saving files, saving files with/without tabs
nnoremap <leader>wv :source $MYVIMRC<CR><CR>
nnoremap <leader>w :w<CR>
inoremap <leader>w <esc>:w<CR>

" tabs to spaces and spaces to tabs
nnoremap <leader>t :set expandtab!<cr> <bar> w<cr>
nnoremap <leader>nt :set expandtab<cr> <bar> w<cr>

"putting the current line at various places on current screen
nnoremap zj zb
nnoremap zk zt

" Go to vim next tab with `gl` and previous with `gL`. Note that default
" behaviour of `gh` is to go into `Select-mode` and when in `netrw`, toggle hidden files.
" As this is not used, currently, hence mapping it! If mapping is changed, then it I
" started using `gh`! :P
nnoremap gl gt
nnoremap gL gT

"searching visually selected block with '//'
vnoremap // y/<C-R>"<CR>

" Cycle through grep results
nnoremap <silent> <leader>f :bn<CR>zv
nnoremap <silent> <leader>b :bp<CR>zv
" nnoremap <leader>co :copen<CR>

" Highlight all occurrences of current word without moving cursor. (Similar to *`` but better.)
nnoremap <silent> <space><space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Select using visual mode and pressing F8 will highlight all occurances of that visually
" selected text.
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <space><space> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

" Load this colorscheme when using `vimdiff`. This file needs to be in
" $HOME/.vim/colors and not as a plugin or else add it in runtime path.
if &diff
    colorscheme apprentice
endif
" set syntax for every `.espconfig` file
au BufNewFile,BufRead .espconfig call dist#ft#SetFileTypeSH("bash")


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" setup for Vundle Plugin manager
"
" set the runtime path to include Vundle and initialize"
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$HOME/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'erig0/cscope_dynamic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'gnattishness/cscope_maps'
" Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
" Plugin 'hari-rangarajan/cctree'
" Plugin 'vim-scripts/taglist.vim'
" Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'sheerun/vim-polyglot'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'blueyed/vim-diminactive'

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
endif

" colorscheme rigel

" let g:onedark_hide_endofbuffer=1
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
" colorscheme onedark

" make comments italic. Be sure to put this after setting colorscheme so that
" colorscheme doesn't override this setting
hi Comment cterm=italic ctermbg=NONE ctermfg=Blue gui=italic

" ####################################

" cscope_dynamic

nmap <F10> <Plug>CscopeDBInit
let g:cscopedb_big_file="$HOME/esp/esp-idf/cscope.out"
let g:cscopedb_small_file="$HOME/esp/cscope_small.db"
let g:cscopedb_auto_init=1

" ####################################

" vim-surround
" (https://vimawesome.com/plugin/surround-vim)
"
" ####################################
"
" vim-polyglot
"
" Master plugin for all language tools. It invokes other plugins for languages.
" `octol/vim-cpp-enhanced-highlight` is a part of polyglot working for C/C++.
" Using `polyglot` messes up with `markdown` files. So avoid using or take care
" of this issue.
" Use individual plugin of polyglot listed on their github page.
"
" ####################################
"
"vim-cpp-enhanced-highlight
"
"Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1

" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1

" Highlighting of class names in declarations is disabled by default. To enable set
let g:cpp_class_decl_highlight = 1

" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1

" Highlighting of user defined functions can be disabled by
" let g:cpp_no_function_highlight = 1

" ####################################
"
" NERDCommenter

filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ####################################

" indentLine

" leading spaces will also be highlighted
let g:indentLine_leadingSpaceEnabled = 1

"show different indentation levels with different characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" " set character for leading spaces. By default it is '˰'
let g:indentLine_leadingSpaceChar = '·'


" ####################################

" lightline.vim
" (https://github.com/itchyny/lightline.vim)

" for showing 2 status line (for lightline)
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
set tags=$HOME/.cstags_dir/*/tags;

" ####################################

" confirm-quit


" ####################################
"
" cscope_maps

let $CSCOPE_EDITOR="Vim"
set nocsverb
" cs kill -1
" cs add $HOME/.cstags_dir/esp-idf/cscope.out
" cs add $HOME/.cstags_dir/repos/cscope.out
set cscopetag

" Do not set `cscoperelative` if using a database not stored in the root directory of a project. 
" set cscoperelative

" Search ctags database first! Useful in case of inline functions.
set csto=0

" Map F6 to build cscope and ctags for esp-idf ONLY and add in current file to
" update the line numbers when new lines are added.
noremap <F6> :!csb $HOME/esp/esp-idf<CR>:cs reset<CR>:set tags=$HOME/.cstags_dir/*/tags;<CR><CR>

" ####################################

" minimap

" let g:minimap_show='<leader>ms'
" let g:minimap_update='<leader>mu'
" let g:minimap_close='<leader>gc'
" let g:minimap_toggle='<leader>gt'


" ####################################
" cctree

" Bindings
" let g:CCTreeKeyTraceForwardTree = '<C-\>>'
" let g:CCTreeKeyTraceReverseTree = '<C-\><'
" let g:CCTreeKeyHilightTree = '<C-l>'
" let g:CCTreeKeySaveWindow = '<C-\>y'
" let g:CCTreeKeyToggleWindow = '<C-\>w'
" let g:CCTreeKeyCompressTree = 'zs'
" let g:CCTreeKeyDepthPlus = '<C-\>='
" let g:CCTreeKeyDepthMinus = '<C-\>-'
" 
" let g:CCTreeWindowVertical = 1
" 
" let g:CCTreeDisplayMode = 1
"             default: 1
" Values: 1 -- Ultra-compact (takes minimum screen width)
"         2 -- Compact       (Takes little more space)
"         3 -- Wide          (Takes copious amounts of space)


" ####################################

" vim-diminactive

highlight ColorColumn ctermbg=0 guibg=#081C23
let g:diminactive_enable_focus = 1


" ####################################

