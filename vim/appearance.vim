" Last Change : Mon 19 Nov 2018 21:42:47.
" 256色の対応(lightline用)
if !has('gui_running')
    set t_Co=256
endif

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
" set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%
 

" 背景色の設定
set background=dark

" カーソルの位置を表示
set ruler

" カラースキームの設定
" colorscheme molokai
" colorscheme hybrid
" colorscheme Benokai
" colorscheme monokai_pro
colorscheme iceberg
set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"


" 行番号表示
set number
" hi LineNr cterm=none ctermbg=none ctermfg=250
" hi CursorLineNr ctermfg=lightblue ctermbg=none

" ポップアップメニューの設定
highlight Pmenu ctermfg=46 ctermbg=0
highlight PmenuSel cterm=bold ctermfg=51 ctermbg=8
highlight PmenuSbar ctermbg=8
highlight PmenuThumb ctermfg=7

" カーソル位置に下線を引く
set cursorline
set cursorcolumn

" highlight CursorLine term=underline ctermbg=235 guibg=#2A3158
" highlight CursorColumn term=underline ctermbg=235 guibg=#2A3158
augroup exit_write_mode
    autocmd!
    " autocmd InsertEnter * hi CursorLine term=none ctermbg=none
    " autocmd InsertEnter * hi CursorColumn term=none ctermbg=none
    " autocmd InsertLeave * hi CursorLine term=underline ctermbg=235
    " autocmd InsertLeave * hi CursorColumn term=underline ctermbg=235
    autocmd InsertEnter * set nocursorline
    autocmd InsertEnter * set nocursorcolumn
    autocmd InsertLeave * set cursorline
    autocmd InsertLeave * set cursorcolumn
augroup END
" highlight CursorLine term=none ctermbg=none
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none
" highlight Folded ctermbg=none
" highlight EndOfBuffer ctermbg=none
" highlight Pmenu ctermbg=none
" highlight PmenuSel ctermbg=none
" highlight PmenuSbar ctermbg=none
" highlight PmenuThumb ctermfg=none ctermbg=none

" highlight TabLineSel ctermbg=245
" highlight TabLine ctermbg=240
" highlight TabLineFill ctermbg=235

" カーソルの表示をモードで変更する
if !has('nvim')
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[2 q"
    let &t_SR.="\e[4 q"
endif
