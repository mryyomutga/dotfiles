" Last Change : Sun 02 Dec 2018 15:52:27.

" 文字コードをUTF-8に設定
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac

set binary
set bomb

" バックアップファイルとスワップファイルを作成しない
set nobackup
set noswapfile

" 編集中にファイルに変更があれば自動更新
set autoread

" カーソルの回り込み
"  whichwrap=b,s,h,l,<,>,[,]

" 行末の1文字先まで移動する
set virtualedit=onemore

" 前回のカーソル位置で開く
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   execute "normal! g'\"" |
            \ endif

" インデント機能の有効化
set autoindent

" バックスペースで行頭を削除
set backspace=indent,eol,start

" スマートインデントの設定
set smartindent

" コマンドラインモード時の補完機能有効化
set wildmenu wildmode=list:longest,full

set clipboard=unnamed
" <---------- Tab ---------->

" タブページを常に表示
set showtabline=2

" タブ幅
set tabstop=4

" タブを半角スペースで埋め込む
set expandtab

" タブ幅
set shiftwidth=4

" <---------- buffer ---------->

" 編集中でもバッファの切り替えを行う
 set hidden

" <---------- search ---------->

" 検索文字列が小文字の場合、大文字小文字を区別する
set noignorecase

" 大文字が含まれている場合は区別する
set smartcase

" インクリメンタルサーチ(順次対象文字列をヒット)
set incsearch

" 検索結果をハイライト
set hlsearch

" vim 起動時にtmuxのステータスバーを非表示
" if !has('gui_running') && $TMUX !=# ''
"   augroup Tmux
"     autocmd!
"     autocmd VimEnter,VimLeave * silent !tmux  status
"   augroup END
" endif

" ノーマルモードになる時にfcitxを無効化
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
imap <silent> <C-[> <ESC>:call ImInActivate()<CR>

set inccommand=split

autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

augroup NewBufTemplate
    autocmd!
    autocmd BufNewFile *.py  0r $HOME/.dotfiles/src/vim/snippets/template.py
    autocmd BufNewFile *.c   0r $HOME/.dotfiles/src/vim/snippets/template.c
    autocmd BufNewFile *.sh  0r $HOME/.dotfiles/src/vim/snippets/template.sh
augroup END

autocmd BufNewFile,BufRead *.hs set tabstop=2
autocmd BufNewFile,BufRead *.hs set shiftwidth=2
