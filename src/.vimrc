"            _
"      __  _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"       \_/ |_|_| |_| |_|_|  \___|
"
" Last Change : Sat 04 May 2019 13:05:05.

set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac
set nobackup
set noswapfile

set binary
set bomb
set modeline
set hidden
set autoread

set virtualedit=onemore
set clipboard=unnamed

autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute "normal! g'\"" |
            \ endif

function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
imap <silent> <C-[> <ESC>:call ImInActivate()<CR>

set t_Co=256

set backspace=indent,eol,start
set wildmenu wildmode=list:longest,full

set showcmd
set showmode
set showmatch
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
" set showtabline=2
set laststatus=2
set ambiwidth=double

set title
set ruler
set number
set list
set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%
" set cursorline
" set cursorcolumn

set noignorecase
set smartcase
set incsearch
set hlsearch

set termguicolors
highlight StatusLine cterm=NONE guifg=#808080 guibg=NONE

let &t_SI.="\e[5 q"
let &t_EI.="\e[2 q"
let &t_SR.="\e[4 q"

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>
