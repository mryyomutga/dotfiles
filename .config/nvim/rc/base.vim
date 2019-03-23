" Last Change : Sat 15 Dec 2018 18:03:46.

" set charcter code utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac

set binary
set bomb

" enable modeline
set modeline

" no make backup and swap file
set nobackup
set noswapfile

" auto reload file when while editting file
set autoread

" go around cursor
set whichwrap=b,s,h,l,<,>,[,]

" move one more eof
" set virtualedit=onemore

" set ctags
set tags+=.git/tags

" open the last cursor position
autocmd bufreadpost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   execute "normal! g'\"" |
            \ endif

" enable auto indent
set autoindent

" delete beginning of line at backspace
set backspace=indent,eol,start

set smartindent

" enable completion at command mode
set wildmenu wildmode=list:longest,full

" enable clipboard
set clipboard^=unnamedplus

" show always tabline
set showtabline=2

" appearance tab length on screen
set tabstop=2
set softtabstop=2

" tab to space
set expandtab

" appearance indent width
set shiftwidth=2

" switch buffer while editting
 set hidden

" Case sensitive
set noignorecase
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
" function! ImInActivate()
"   call system('fcitx-remote -c')
" endfunction
" imap <silent> <C-[> <ESC>:call ImInActivate()<CR>

set inccommand=nosplit

autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

set undofile
set winheight=8
set shortmess+=i
set completeopt=menuone
set completeopt+=noinsert
set ignorecase
set wildignorecase

set clipboard+=unnamedplus
"if $display !=# ''
"  set clipboard+=unnamedplus
"endif

augroup quickfix
  autocmd!
  autocmd quickfixcmdpost make,*grep* cwindow
augroup end

augroup im
  autocmd!
  autocmd insertleave * call im#fcitx()
augroup end

augroup template
  autocmd!
  autocmd bufnewfile *.* silent! call skel#load()
augroup end
