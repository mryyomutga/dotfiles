" Last Change : Tue 06 Nov 2018 23:34:15.
" <---------- dein ---------->

set nocompatible

set encoding=utf-8
scriptencoding utf-8

filetype plugin indent off

" Required:
set runtimepath+=~/.dotfiles/vim/plugins/repos/github.com/Shougo/dein.vim

" Required:
" Pythonの設定
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog=expand('$HOME/bin/python')

" Required:
if dein#load_state('~/.dotfiles/vim/plugins')
    call dein#begin('~/.dotfiles/vim/plugins')

    " Plugin Manager
    " Required:
    call dein#add('~/.dotfiles/vim/plugins/repos/github.com/Shougo/dein.vim')

    " ファイル操作を簡単にする
    call dein#add('Shougo/denite.nvim')

    " タイムスタンプを自動で挿入
    call dein#add('vim-scripts/autodate.vim')

    " 最近使用したファイルを表示する
    call dein#add('Shougo/neomru.vim')

    " クラス・関数名を一覧表示する
    " call dein#add('Shougo/unite-outline.vim')

    " プログラムの編集中に実行
    call dein#add('thinca/vim-quickrun')

    " 入力補完
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/vimproc.vim',{'build':'make'})
    " call dein#add('Shougo/deoplete.nvim')
    " if !has('nvim')
    "     call dein#add('roxma/nvim-yarp')
    "     call dein#add('roxma/vim-hug-neovim-rpc')
    " endif

    " スニペット
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')

    " call dein#add('rhysd/vim-operator-surround.vim')

    " Kotlinのsyntax
    call dein#add('udalov/kotlin-vim')

    " インデントの可視化
    call dein#add('nathanaelkane/vim-indent-guides')

    " コメントアウトを楽に行う
    call dein#add('tyru/caw.vim.git')

    " ウィンドウのサイズ調整プラグイン
    call dein#add('simeji/winresizer')

    " ステータスラインのカスタマイズ
    call dein#add('itchyny/lightline.vim')

    " git操作を可能にする
    call dein#add('tpope/vim-fugitive')

    " ファイルツリー操作
    call dein#add('scrooloose/nerdtree')
    " call dein#add('ryanoasis/vim-devicons')

    " C++コード補完
    call dein#add('justmao945/vim-clang')
    call dein#add('Shougo/neoinclude.vim')

    " Pythonの補完
    call dein#add('davidhalter/jedi-vim')

    " Tabキーで補完するプラグイン
    " call dein#add('cohama/lexima.vim')
    "call dein#add('itmmaoth/doorboy.vim')
    call dein#add('ervandew/supertab')

    " Goの補完やコマンドなど
    call dein#add('fatih/vim-go')
    call dein#add('nsf/gocode', {'rtp':'vim/'})

    " 括弧などの補完
    " call dein#add('cohama/lexima.vim')

    " flake8のコード検査
    "call dein#add('andviro/flake8-vim.vim')

    " pep8のインデントに対応
    " call dein#add('hynek/vim-python-pep8-indent.vim')

    " call dein#add('hachibeeDI/python_hl_lvar.vim')

    " カラースキーム
    call dein#add('ujihisa/unite-colorscheme')
    call dein#add('tomasr/molokai')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('phanviet/vim-monokai-pro')
    call dein#add('reedes/vim-colors-pencil')
    call dein#add('benjaminwhite/Benokai')
    call dein#add('cocopon/iceberg.vim')

    call dein#add('popkirby/lightline-iceberg')

    " Required:
    call dein#end()

endif

" Required:
call dein#save_state()

" If there are the plugins that has not been installed on startup,
" dein is checking and installing.
if dein#check_install()
    call dein#install()
endif

" <---------- End ---------->

" Required:
filetype plugin indent on

" シンタックスハイライトを有効化
syntax on

" <---------- Setting ---------->

" 文字コードをUTF-8に設定
set fenc=utf-8

" 保存時の文字コードをUTF-8に設定
set fileencoding=utf-8

" バックアップファイルとスワップファイルを作成しない
set nobackup
set noswapfile

" 編集中にファイルに変更があれば自動更新
set autoread

" 入力中のコマンドをステータス表示
set showcmd

" カーソルの回り込み
" set whichwrap=b,s,h,l,<,>,[,]

" 行末の1文字先まで移動する
set virtualedit=onemore

" マルチバイト文字列の描画設定
set ambiwidth=double

" <---------- Visual ---------->

" タイトル表示
set title

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
" set smartindent

" 対応する括弧を強調
set showmatch

" ステータスラインを常に表示
set laststatus=2

" コマンドラインモード時の補完機能有効化
set wildmenu wildmode=list:longest,full

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 256色の対応(lightline用)
set t_Co=256

" clipboardの有効化
" " + y でクリップボードにコピー
set clipboard=unnamed,autoselect

" シンタックスのカラー
" set term=xterm-256color

source ~/.dotfiles/vim/scripts/toggle_background.vim

" 背景色の設定
set background=dark

" autocmd ColorScheme * highlight Search ctermbg=11

" カラースキームの設定
" colorscheme molokai
" colorscheme hybrid
" colorscheme Benokai
colorscheme iceberg
" colorscheme monokai_pro

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

" 行番号表示
set number
hi LineNr ctermbg=none ctermfg=239
" hi LineNr cterm=none ctermbg=none ctermfg=green
hi CursorLineNr cterm=bold ctermfg=69 ctermbg=none

" カーソルの位置を表示
set ruler

" ポップアップメニューの設定
highlight Pmenu ctermfg=46 ctermbg=0
highlight PmenuSel cterm=bold ctermfg=51 ctermbg=8
highlight PmenuSbar ctermbg=5
highlight PmenuThumb ctermfg=7

" カーソルの表示をモードで変更する
let &t_SI.="\e[5 q"
let &t_EI.="\e[2 q"
let &t_SR.="\e[4 q"
"
" <---------- Tab ---------->

" タブページを常に表示
set showtabline=2

" タブ幅
set tabstop=4

" タブを半角スペースで埋め込む
set expandtab

" タブ幅
set shiftwidth=4

" スマートインデント
set smartindent

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
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

" <---------- keymap ---------->

" <<--------- normal --------->>

" カーソル移動系
nnoremap j gj
nnoremap k gk
nnoremap <S-h> ^
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <S-l> $

nnoremap s <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

" Ctrl + h & lでタブの移動
nnoremap <C-l> gt
nnoremap <C-h> gT

" 水平分割
nnoremap ss :split<CR> <C-w><C-w>
" 垂直分割
nnoremap sv :vsplit<CR> <C-w><C-w>

" 背景の透過切り替え
nnoremap tp :ToggleBackground<CR>

" ESC2回入力でハイライトの解除
nnoremap <Esc><Esc> :nohlsearch<CR><CR>

" <<--------- insert --------->>

" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Right> <Nop>
" inoremap <Left> <Nop>
" inoremap OA <Nop>
" inoremap OB <Nop>
" inoremap OC <Nop>
" inoremap OD <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Right> <Nop>
imap <Left> <Nop>
" imap OA <Nop>
" imap OB <Nop>
" imap OC <Nop>
" imap OD <Nop>

" <<--------- Visual --------->>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>

" <<--------- Plugin --------->>

" config tryu
" ctrl + /で選択行のコメントアウト
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" inoremap <C-_> <Plug>(caw:hatpos:toggle)

" config NERDTree
" ctrl + tでNERDTreeを起動
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if  argc() != 0 && !exists("s:std_in") | NERDTree | endif

" 隠しファイルをデフォルトで表示
" let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1

"ctrl + cでQuickRunを停止させる
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" <---------- End ---------->

" <---------- Plugin Setting ---------->

" autodate.vimの設定
let g:autodate_lines=20
let g:autodate_keyword_pre='Last Change : '
let g:autodate_format="%a %d %b %Y %H:%M:%S"

" NERDTreeの設定
" 拡張子のハイライト
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" vim-quickrunの設定
:command Run QuickRun
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 8sp",
\       "outputter/buffer/close_on_empty" : 1,
\       "outputter/error/error" : "quickfix",
\       "outputter/error/success" : "buffer",
\       "outputter/buffer/into" : 1,
\       "outputter" : "error",
\       }
\  }

" winresizerの設定
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" vim-goの設定
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" neocomplete, neosnippetsの設定
if dein#check_install('neocomplete.vim')
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " set auto delimiter
    let g:neocomplete#enable_auto_delimiter=1
    " Set auto completion start length
    let g:neocomplete#auto_completion_start_length=1
    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
endif

" DocStringを非表示にする
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabContextDefalutCompletionType="context"
let g:SuperTabDefaultCompletionType="<c-n>"

" NeoCompleteの設定
let g:neocomplete#enable_at_startup=1
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_overwrite_completefunc=1
let g:neocomplete#force_omni_input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" deopleteの設定
" call deoplete#enable()

" vim-clangの設定
" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

" if executable('clang-3.6')
"     let g:clang_exec = 'clang-3.6'
" elseif executable('clang-3.5')
"     let g:clang_exec = 'clang-3.5'
" elseif executable('clang-3.4')
"     let g:clang_exec = 'clang-3.4'
" else
"     let g:clang_exec = 'clang'
" endif

" if executable('clang-format-3.6')
"     let g:clang_format_exec = 'clang-format-3.6'
" elseif executable('clang-format-3.5')
"     let g:clang_format_exec = 'clang-format-3.5'
" elseif executable('clang-format-3.4')
"     let g:clang_format_exec = 'clang-format-3.4'
" else
"     let g:clang_exec = 'clang-format'
" endif

let g:clang_exec = 'clang'
let g:clang_format_exec = 'clang-format'
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" lightlineの設定
" let g:lightline ={}
" let g:lightline.colorscheme = 'iceberg
let g:lightline = {
        \ 'colorscheme': 'srcery_drk',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], ['filetype'] , ['fileencoding']],
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

" <---------- End ---------->
