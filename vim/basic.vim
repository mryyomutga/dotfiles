" Last Change : Sun 04 Nov 2018 15:40:14.
" バックアップファイルとスワップファイルを作成しない
set nobackup
set noswapfile

" 編集中にファイルに変更があれば自動更新
set autoread

" カーソルの回り込み
" set whichwrap=b,s,h,l,<,>,[,]

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

" <---------- Tab ---------->

" タブページを常に表示
set showtabline=2

" タブ幅
set tabstop=4

" タブを半角スペースで埋め込む
set expandtab

" タブ幅
set shiftwidth=4

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
"     autocmd VimEnter,VimLeave * silent !tmux set status
"   augroup END
" endif

" ノーマルモードになる時にfcitxを無効化
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
imap <silent> <C-[> <ESC>:call ImInActivate()<CR>

