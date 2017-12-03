" シンタックスハイライトを有効化
syntax on

" タイトル表示
set title

" 行番号表示
set number

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
"hi cursorline ctermfg=lightblue
hi lineNr ctermfg=lightgreen

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

" Viの互換無効化
set nocompatible

" lightline用設定
" scriptencoding utf-8
" set encoding=utf-8
" set guifont=Ricty_for_Powerline=5
" set guifontwide=Ricty=5

" config NeoBundle
filetype plugin indent off

set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundleでのスクリプト管理
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

" Vimでシェルを使う
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc'

" インデントの可視化
NeoBundle 'nathanaelkane/vim-indent-guides'

" コメントアウトを楽に行う
NeoBundle "tyru/caw.vim.git"

" ステータスラインをいい感じに変更する
NeoBundle 'itchyny/lightline.vim'

" gitのブランチを取得する
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'scrooloose/nerdtree'

NeoBundleCheck

call neobundle#end()
filetype plugin indent on

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

" config NERDTree
" ctrl + eでNERDTreeを起動
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" config lightline
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

