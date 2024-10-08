"  ______________________________
" < Welcome to my Vim config. 😃 >
"  ------------------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

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
set laststatus=0

" Only for GVim.
if has("gui_running")
    colorscheme apprentice
endif

" Statusline displays ascii values also. To use this, `set ls=2`.
set statusline=%<%f%h%m%r%=%b\ [0x%B]\ \ %l,%c%V\ %P

" The width of a TAB is set to 4.  Still it is a \t. It is just that Vim will
" interpret it to be having a width of 4. While using tabs, use `tabstop` and
" not `softtabstop` (leave it unset). While using spaces instead of tabs, use
" `softtabstop` and not `tabstop`(unset).
" set tabstop=4

" Indents with '>' will have a width of 4.
set shiftwidth=4

" Sets the number of columns for a TAB.
set softtabstop=4
" no spaces, but tabs!
set noexpandtab

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
set cmdheight=2

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

" setting vim to enter in a new line after 90 characters. Lines will get formatted
" automatically. If set explicitly, select and use `gq` to format lines
" set textwidth=90

" Wraps lines after end of screen.
set wrap

" Continue searching a file when reached start/end while searching (on by default).
set wrapscan

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

" Setting list characters
" Some special characters: ▶    →   ␣   ·   ⟨   ⟩   ↲   «   »
set showbreak=▶\ 
set listchars=tab:·\ ,nbsp:␣,trail:·,extends:⟩,precedes:⟨

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
    " set t_ti=␛7␛[r␛[?47h t_te=␛[?47l␛8
" (Where ␛ is an <Esc>, type CTRL-V <Esc> to insert it)


" When on, splitting a window will put the new window right of the
" current one.
set splitright
set splitbelow

"setting timeout for esc key as 0
set timeoutlen=1000 ttimeoutlen=0

" set scrolling with cursor in middle
"short for set scrolloff=999  also zk/zj won't work in this mode. use ':set so=0' to exit this mode
set so=4

" Autoload files when changed externally.
set autoread

" `set spell` highlights color with red, but now it will underline
set nospell
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=015      ctermbg=000

" Set the directory where the swap files are stored, so they don't clutter  normal directories.
set swapfile
" set dir=$HOME/.tmp/

" Set the directory variable
let dir = $HOME . '/.tmp/'

" Check if the directory exists, and create it if not
if !isdirectory(dir)
    call mkdir(dir, "p")
    echom "Directory created: " . dir
endif

" Set the directory
let &dir=dir

" URxvt requires these settings to render color in vim properly.
set notermguicolors
set t_Co=256

" Neovim - Cursor to blink in normal mode also.
set guicursor=a:blinkon100

" For not showing modes (eg: -- INSERT --) in status line.
set noshowmode

" ctags
" set tags=$HOME/.cstags_dir/esp-idf/TAGS;

" highlighting options in vsplit and gui
hi vertsplit guifg=fg guibg=bg
hi StatusLine guibg=White guifg=Black

" Set color for keys mentioned in `listchars`
" hi SpecialKey ctermfg=darkgrey guifg=grey70

hi cursorline cterm=NONE ctermbg=000000

" Changes colors for current line number and relativenumbers. After this,
" current line number is in yellow (by default which is changed with
" `CursorLineNr`) and relative lines are in Grey (maybe DarkGrey). Colorscheme
" may overwrite this.
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" highlight CursorLineNr cterm=Bold,Italic ctermbg=Black ctermfg=Yellow gui=NONE guibg=#444444 guifg=#ffff00
highlight CursorLineNr cterm=NONE

" Matching braces color.
hi MatchParen cterm=none ctermbg=Green ctermfg=Black

" Color setting for visually selected text.
highlight Visual cterm=NONE ctermbg=Lightgrey ctermfg=Black guibg=Grey40

" Highlight fold color.
hi Folded ctermbg=black ctermfg=yellow

filetype indent on
syntax enable

nnoremap <silent><leader>a : set relativenumber!<CR>

"<space>l Toggles highlighted word.
nnoremap <silent> <space>l :set hlsearch!<CR>

" copy  from/to + clipboard simplified
vnoremap <CR> "+y
vnoremap <C-c> "+y
nnoremap <C-c> V"+y
nnoremap <C-p> "*p
vnoremap <C-p> xh"*p
nnoremap <C-P> "+p
vnoremap <C-P> xh"+p
nnoremap YY <esc>V"+y

" shortcut for splitting screens/windows
noremap <C-Left> <C-w>h
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l
noremap <C-Down> <C-w>j
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
" noremap <C-o> <C-w>o
" noremap <C-s> <C-w>s
" noremap <C-v> <C-w>v
nnoremap <silent> - :vertical resize -3<CR>
nnoremap <silent> = :vertical resize +3<CR>
nnoremap <silent> + :resize +3<CR>
nnoremap <silent> _ :resize -3<CR>

" copy file path to + clipboard (system clipboard).
nmap <silent>,cp :let @+=expand("%:p")<CR>:echo "File path copied"<CR>

" copy function name to + clipboard (system clipboard).
nmap <silent>,cf ``mo``mp][%b%b"+ye`o`p:echom @+ "copied to clipboard"<CR>

command! NUM set relativenumber! number!
" This will start nvim and quit so the curosor will blink in Vim also! Hackish way of
" making cursor blink in Vim :P
command! C !nvim -c "q" && echo 'Is cursor blinking?'

" Command 'F' (`:F`) will show full file path
command! F echo expand('%:p')

" Command `PI` will install vim plugins with Vundle
command! PI PluginInstall

" Open `$HOME/.vimrc`
command! EV tabe + $HOME/.vimrc

" Build suckless apps.
command! Bsa !sudo make uninstall clean install >/dev/null && echo "Successfully built, launching st" && st >/dev/null &

" Open new tab.
command! EE tabe

function! s:Newterm()
    tabe
    term
    only
endfunction

" Open terminal in new tab without stopping vim.
command! TT call s:Newterm()

" Enable and disable mouse.
command! ME set mouse+=a
command! MD set mouse-=a

" Set cursor rate.
command! SETX !xset r rate 400 50

" To map Enter, backspace with new line in normal mode. Not a good idea to map
" Enter key as it is used to cycle results in `grep`/`vimgrep`.
" nmap <CR> o<Esc>
" nmap <BS> i<BS><ESC>l

" saving files, saving files with/without tabs
" inoremap <leader>w <esc>:w<CR>
" nnoremap <leader>w :w<CR>

" tabs to spaces and spaces to tabs
nnoremap <silent><leader>t :set noexpandtab<CR>:echom "Using tabs"<CR>
nnoremap <silent><leader>nt :set expandtab<CR>:echom "Using spaces"<CR>

nnoremap <silent> <leader>s :setlocal spell!<cr>:set spell?<cr>

" Toggle wrap.
nnoremap <silent><leader>q :set wrap!<CR>:echo "Toggle wrapping"<CR>

"putting the current line at various places on current screen
nnoremap zj zb
nnoremap zk zt

" Go to vim next tab with `gl` and previous with `gL`. Note that default
" behaviour of `gh` is to go into `Select-mode` and when in `netrw`, toggle hidden files.
" As this is not used, currently, hence mapping it! If mapping is changed, then it I
" started using `gh`! :P
nnoremap gl gt
nnoremap gL gT

" Cycle through various buffers.
nnoremap <silent> <leader>f :bn<CR>zv
nnoremap <silent> <leader>F :bp<CR>zv
" nnoremap <leader>co :copen<CR>

" Get current function name. Start by going to end of a function (with ][) so that if
" opening brace of function is not in new line, this wouldn't skip a function. This might
" fail depending upon vim's implementation of `%`. In case of a commented '{', this
" mapping might misbehave.
nnoremap _F ``mo``mp][%b%b"xye`o`p:echo @x<CR>

" Debug logs in C below current line.
nnoremap _Q oets_printf("\n@@@@  @@@@ \n");<esc>4bhi
nnoremap _P oprintf("\n@@@@  @@@@ \n");<esc>4bhi

" Highlight all occurrences of current word without moving cursor and show number of occurances. (Similar to *`` but better.)
nnoremap <silent> <space><space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap ,cc :%s///gn<CR>

" Toggle cursor line.
nnoremap <silent> <leader>l :set cursorline!<cr>

" Move when nowrap is set.
" nnoremap <C-h> 5zh
" nnoremap <C-l> 5zl

" Mapping to go to start of funtion.
nnoremap ]{ m>]}%`>``
" nnoremap ]] ][][%
"
" Source .vimrc.
nnoremap <leader>v :source $MYVIMRC<CR>:echom "source $MYVIMRC"<CR>

" Select using visual mode and pressing mapped key will highlight all occurances of that
" visually selected text and show number of occurances.
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <space><space> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>
" For neovim use below binding. above one doesn't work well with nvim. Below
" is not the exact way of implementing but more of a hack.
" vnoremap <space><space> y/\V<C-R>=escape(@",'/\')<CR><CR>:set hls<CR>

" Check diff of saved and unsaved versions of the file
function! s:DiffGitWithSaved()
        let filename = expand('%')
        let diffname = tempname()
        execute 'silent w! '.diffname
        execute '!git diff --color=always --no-index -- '.shellescape(filename).' '.diffname
endfunction
command! DiffGitSaved call s:DiffGitWithSaved()
nmap <leader>d :DiffGitSaved<CR>

" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k

" Single escape turns on normal mode in bash.
tnoremap <esc><esc> <C-\><C-n>


" Load this colorscheme when using `vimdiff`. This file needs to be in
" $HOME/.vim/colors and not as a plugin or else add it in runtime path.
if &diff
    colorscheme apprentice
endif

" Save a file as soon as it is opened in vim even when it's empty.
" autocmd BufNewFile * :w

" Source Xdefaults and Xresources.
autocmd BufWritePost .Xresources :!xrdb $HOME/.Xresources
autocmd BufWritePost .Xdefaults :!xrdb $HOME/.Xdefaults

" Restarting configuration files
autocmd BufWritePost dunstrc :!pkill dunst && nohup dunst -config $HOME/.config/dunst/dunstrc &
autocmd BufWritePost compton.conf :!pkill compton && compton --config $HOME/.config/compton/compton.conf -b
autocmd! BufWritePost picom.conf :!pkill picom; sleep 0.1s; picom --config $HOME/.config/picom/picom.conf -b

" Source vim configuration upon save.
autocmd! BufWritePost $MYVIMRC :source $MYVIMRC

" Functions and auto-commands to load cscope and ctags databases/files when
" opening suckelss application files.
function! s:Configsuckless()
    call s:Configdwm()
    call s:Configst()
endfunction

function! s:Configdwm()
    cs a $HOME/.cstags_dir/dwm/cscope.out
    set tags+=$HOME/.cstags_dir/dwm/tags
    set noexpandtab
endfunction

function! s:Configst()
    cs a $HOME/.cstags_dir/st/cscope.out
    set tags+=$HOME/.cstags_dir/st/tags
    set noexpandtab
endfunction

autocmd BufRead config.h call s:Configdwm()
autocmd BufRead dwm.h,dwm.c call s:Configdwm()
autocmd BufRead st.c,x.c call s:Configst()

autocmd! BufWritePost dwmbar :!pkill dwmbar; dwmbar >/dev/null 2>&1 &

autocmd BufRead config call dist#ft#SetFileTypeSH("config")

" Automatically enable spell check for specific filetypes.
autocmd FileType gitcommit,markdown setlocal spell

" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! plugins !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

" setup for Vundle Plugin manager
"
" set the runtime path to include Vundle and initialize"
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$HOME/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'erig0/cscope_dynamic'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'tpope/vim-surround'
Plugin 'gnattishness/cscope_maps'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'scrooloose/nerdtree'
" Plugin 'blueyed/vim-diminactive'
" Plugin 'ctrlpvim/ctrlp.vim'

" Some good colorschemes
Plugin 'romainl/Apprentice'
" Plugin 'altercation/vim-colors-solarized'
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

hi Comment cterm=italic ctermbg=NONE ctermfg=Blue gui=italic

" ####################################

" cscope_dynamic

" nmap <F10> <Plug>CscopeDBInit
" let g:cscopedb_big_file="$HOME/.cstags_dir/esp-idf/cscope.out"
" let g:cscopedb_small_file="$HOME/.cstags_dir/esp-idf/cscope_small.db"
" let g:cscopedb_auto_init=1

" ####################################

" vim-surround
" (https://vimawesome.com/plugin/surround-vim)
"
" ####################################
"
" NERDCommenter

filetype plugin on

runtime macros/matchit.vim

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ####################################

"    " lightline.vim
"    " (https://github.com/itchyny/lightline.vim)
"
"    " For always showing status line in vim. (By default it is set to 1).
"    set laststatus=2
"
"    " For not showing modes (eg: -- INSERT --) in status line.
"    set noshowmode
"
"    if !has('gui_running')
"      set t_Co=256
"    endif
"
"    let g:lightline = {
"          \ 'colorscheme': 'one',
"          \ 'active': {
"          \   'left': [ [ 'mode', 'paste' ],
"          \             [ 'readonly', 'filename', 'modified' ] ],
"          \   'right': [ [ 'lineinfo' ],
"          \              [ 'percent' ],
"          \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
"          \ },
"          \ 'component': {
"          \ 'filename': '%f',
"          \ 'charvaluehex': '0x%B'
"          \ }
"          \ }
"

" ####################################
"
" cscope_maps

let $CSCOPE_EDITOR="Vim"
set nocsverb
" cs kill -1
" cs a $HOME/.cstags_dir/repos/cscope.out
set cscopetag

" Do not set `cscoperelative` if using a database not stored in the root directory of a project.
" set cscoperelative
set nocscoperelative

" Search ctags database first. Useful in case of inline functions. If 'csto'
" is set to one, tag file(s) are searched before cscope database(s).  The
" default is zero.
set csto=0

" Bindings compatible with Emacs' cscope.
nnoremap <C-\>u <C-t>

" ####################################

" vim-diminactive

"       highlight ColorColumn ctermbg=0 guibg=#081C23
"       let g:diminactive_enable_focus = 1


" ####################################

"   " CtrlP
"   " Refer https://github.com/ctrlpvim/ctrlp.vim
"
"   " Binding for invoking Ctrlp. Need not be Ctrl-p. :P
"   let g:ctrlp_map = '<C-l>'
"
"   " Set working directory.
"   let g:ctrlp_working_path_mode = 'rc'
"
"   " Ignore gitignore files.
"   " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
