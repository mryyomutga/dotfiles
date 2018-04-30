" シンタックスハイライトを有効化
syntax on

" タイトル表示
set title

" 行番号表示
set number
hi LineNr ctermfg=white

" ステータスラインを常に表示
set laststatus=2

" タブページを常に表示
set showtabline=2

" タブ幅
set tabstop=4

" タブを半角スペースで埋め込む
" set expandtab

" タブ幅
set shiftwidth=4

" インデント機能の有効化
set autoindent
" set smartindent

" カーソルの位置を表示
set ruler

" カーソル位置に下線を引く
set cursorline
hi CursorLine term=reverse cterm=none ctermbg=0
hi CursorLineNr ctermfg=199
" hi lineNr ctermfg=lightgreen

" カーソルの回り込み
set whichwrap=b,s,h,l,<,>,[,]

" 対応する括弧を強調
set showmatch

" インクリメンタルサーチ
" set incsearch

" 大文字・小文字を無視しない
set smartcase

" 検索結果をハイライト
set hlsearch

" 背景色の設定
set background=dark

" 外部エディタからの変更を読み直す
set autoread

" コマンドラインモード時の補完機能有効化
set wildmenu wildmode=list:longest,full

" 上書き時にバックアップの作成を無効化
set nobackup

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 256色の対応(lightline用)
set t_Co=256

" clipboardの有効化
" " + y でクリップボードにコピー
set clipboard=unnamed,autoselect

" Viの互換無効化
" set nocompatible

" lightline用設定
" scriptencoding utf-8
" set encoding=utf-8
" set guifont=Ricty_for_Powerline=5
" set guifontwide=Ricty=5

" config NeoBundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle'))
endif

" NeoBundleでのスクリプト管理
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/Unite.vim'

" クラス・関数名を一覧表示する
" NeoBundle 'Shougo/unite-outline.vim'

" スニペットプラグイン
NeoBundle 'Shougo/neosnippet.vim'

" IDE的な機能を設定する
" NeoBundle 'kana/vim-smartinput.vim'
" NeoBundle 'kana/vim-operator.vim'
" NeoBundle 'kana/vim-textobj-user.vim'
" NeoBundle 'kana/vim-operator-replace.vim'

" NeoBundle 'rhysd/vim-operator-surround.vim'

" Vimでシェルを使う
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'

" インデントの可視化
NeoBundle 'nathanaelkane/vim-indent-guides'

" コメントアウトを楽に行う
NeoBundle "tyru/caw.vim.git"

" ステータスラインをいい感じに変更する
NeoBundle 'itchyny/lightline.vim'

" gitのブランチを取得する
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'scrooloose/nerdtree'

" C++コード補完
NeoBundle 'justmao945/vim-clang'
NeoBundle 'Shougo/neoinclude.vim'

" Pythonの補完
NeoBundle 'davidhalter/jedi-vim'

" Tabキーで補完するプラグイン
" NeoBundle 'cohama/lexima.vim'
NeoBundle 'itmmaoth/doorboy.vim'
NeoBundle 'ervandew/supertab'

" flake8のコード検査
" NeoBundle 'andviro/flake8-vim.vim'

" pep8のインデントに対応
" NeoBundle 'hynek/vim-python-pep8-indent.vim'

" NeoBundle 'hachibeeDI/python_hl_lvar.vim'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

" config vimshell
" ctrl + lを2回入力でshellを起動
nnoremap <S-l><S-l> :split<CR>:VimShell<CR><esc><C-w>J:res -10<esc>i 
let g:vimshell_prompt='>> '
let g:vimshell_user_prompt='getcwd()'
let g:vimshell_secondary_prompt="〉 "

" config tryu
" ctrl + /で選択行のコメントアウト
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" imap <C-_> <esc><Plug>(caw:hatpos:toggle)<S-$>a

" config NERDTree
" ctrl + eでNERDTreeを起動
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" DocStringを非表示にする
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabContextDefalutCompletionType="context"
let g:SuperTabDefaultCompletionType="<c-n>"

" set config neocomplete
let g:neocomplete#enable_at_startup=1
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_overwrite_completefunc=1
let g:neocomplete#force_omni_input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" set config vim-clang

" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
else
    let g:clang_exec = 'clang'
endif

if executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
else
    let g:clang_exec = 'clang-format'
endif

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" set config lightline
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], ['filetype' ,'fileencoding'] ],
        \   'right': [ ['percent'], ['lineinfo'], ['fugitive', 'fileformat'] ]
        \
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode',
        \ },
        \ 'separator' : {'left' : "\u2b80", 'right' : "\u2b82" },
        \ 'subseparator' : {'left' : "\u2b81", 'right' : "\u2b83" },
        \ }

let g:lightline.tabline={
        \ 'filename': 'tabs'
        \ }
let g:lightline.tab={
        \ 'active': ['tabnum', 'filename', 'modified'],
        \ 'inactive': ['tabnum', 'filename', 'modified']
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch != '' ? "\u2b60 ".branch : ''
  endif
endfunction

" function! LightlineFugitive()
"   if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"     return "\u2b60 ".fugitive#head()
" else
"     return '-'
"   endif
" endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

