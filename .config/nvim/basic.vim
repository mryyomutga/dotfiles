" Last Change : Sat 15 Dec 2018 01:52:04.

" Set charcter code UTF-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac

set binary
set bomb

" Enable modeline
set modeline

" No make backup and swap file
set nobackup
set noswapfile

" Auto reload file when while editting file
set autoread

" Go around cursor
set whichwrap=b,s,h,l,<,>,[,]

" Move one more EOF
" set virtualedit=onemore

" set ctags
" set tags=.tags;$HOME

" Open the last cursor position
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   execute "normal! g'\"" |
            \ endif

" Enable auto indent
set autoindent

" Delete Beginning of line at backspace
set backspace=indent,eol,start

set smartindent

" Enable completion at command mode
set wildmenu wildmode=list:longest,full

" Enable clipboard
set clipboard^=unnamedplus

" <---------- Tab ---------->

" Show always tabline
set showtabline=2

" appearance tab length on screen
set tabstop=4

" tab to space
set expandtab

" appearance indent width
set shiftwidth=4

" <---------- buffer ---------->

" Switch buffer while editting
 set hidden

" <---------- search ---------->

" Case sensitive
set noignorecase

" 大文字が含まれている場合は区別する
set smartcase

" wrap search
set wrapscan

" Incremental searching
set incsearch

" Highlight search result
set hlsearch

" Hide tmux status line when launch vim
" if !has('gui_running') && $TMUX !=# ''
"   augroup Tmux
"     autocmd!
"     autocmd VimEnter,VimLeave * silent !tmux  status
"   augroup END
" endif

" disable fcitx when escape insert mode
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
imap <silent> <C-[> <ESC>:call ImInActivate()<CR>

set inccommand=split

autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

augroup NewBufTemplate
    autocmd!
    autocmd BufNewFile *.py  0r $HOME/.dotfiles/vim/snippets/template.py
    autocmd BufNewFile *.c   0r $HOME/.dotfiles/vim/snippets/template.c
    autocmd BufNewFile *.sh  0r $HOME/.dotfiles/vim/snippets/template.sh
augroup END

autocmd BufNewFile,BufRead *.hs set tabstop=2
autocmd BufNewFile,BufRead *.hs set shiftwidth=2
