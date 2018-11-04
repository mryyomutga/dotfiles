" Last Change : Sun 04 Nov 2018 15:39:50.
" 256色の対応(lightline用)
set t_Co=256

" マルチバイト文字列の描画設定
set ambiwidth=double

" タイトル表示
set title

" 入力中のコマンドをステータス表示
set showcmd

" 対応する括弧を強調
set showmatch

" ステータスラインを常に表示
set laststatus=2

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
"
" 背景色の設定
set background=dark

" カーソルの位置を表示
set ruler

" カラースキームの設定
" colorscheme molokai
" colorscheme hybrid
" colorscheme Benokai
" set termguicolors
" colorscheme monokai_pro
" colorscheme iceberg

" 行番号表示
set number
hi LineNr cterm=none ctermbg=none ctermfg=250
hi CursorLineNr cterm=bold ctermfg=lightblue ctermbg=none

" ポップアップメニューの設定
highlight Pmenu ctermfg=46 ctermbg=0
highlight PmenuSel cterm=bold ctermfg=51 ctermbg=8
highlight PmenuSbar ctermbg=5
highlight PmenuThumb ctermfg=7

" カーソル位置に下線を引く
set cursorline
set cursorcolumn
hi CursorLine term=underline cterm=bold ctermbg=235
hi CursorColumn term=underline ctermbg=235
augroup exit_write_mode
    autocmd!
    autocmd InsertEnter * hi CursorLine term=none cterm=bold ctermbg=none
    autocmd InsertEnter * hi CursorColumn term=none ctermbg=none
    autocmd InsertLeave * hi CursorLine term=underline cterm=bold ctermbg=235
    autocmd InsertLeave * hi CursorColumn term=underline ctermbg=235
augroup END

" カーソルの表示をモードで変更する
if !has('nvim')
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[2 q"
    let &t_SR.="\e[4 q"
endif
