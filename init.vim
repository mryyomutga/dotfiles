" <---------- dein ---------->
if &compatible
    set nocompatible
endif

filetype plugin indent off

" Required:
set runtimepath+=~/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim

" Required:
" Pythonの設定
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog=expand('$HOME/bin/python')

" Required:
if dein#load_state('~/.dotfiles/.vim/plugins')
    call dein#begin('~/.dotfiles/.vim/plugins')

    " Plugin Manager
    " Required:
    call dein#add('~/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim')

    " ファイル操作を簡単にする
    call dein#add('Shougo/denite.nvim')

    " 最近使用したファイルを表示する
    call dein#add('Shougo/neomru.vim')

    " クラス・関数名を一覧表示する
    " call dein#add('Shougo/unite-outline.vim')

    " 入力補完
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
    " call dein#add('Shougo/deoplete.nvim')
    " if !has('nvim')
    "     call dein#add('roxma/nvim-yarp')
    "     call dein#add('roxma/vim-hug-neovim-rpc')
    " endif

    " スニペット
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')

    " IDE的な機能を設定する
    " call dein#add('kana/vim-smartinput.vim')
    " call dein#add('kana/vim-operator.vim')
    " call dein#add('kana/vim-textobj-user.vim')
    " call dein#add('kana/vim-operator-replace.vim')

    " call dein#add('rhysd/vim-operator-surround.vim')

    " Vimでシェルを使う
    call dein#add('Shougo/vimshell.vim')
    call dein#add('Shougo/vimproc.vim', {'build':'make'})

    " インデントの可視化
    call dein#add('nathanaelkane/vim-indent-guides')

    " コメントアウトを楽に行う
    call dein#add('tyru/caw.vim.git')

    " ステータスラインのカスタマイズ
    call dein#add('itchyny/lightline.vim')

    " git操作を可能にする
    call dein#add('tpope/vim-fugitive')

    " ファイルツリー操作
    call dein#add('scrooloose/nerdtree')

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

" カーソル位置に下線を引く
set cursorline
" hi clear CursorLine
hi CursorLine cterm=underline ctermfg=none ctermbg=none
" hi CursorLine term=reverse cterm=none ctermbg=none
" hi CursorLineNr ctermfg=199 ctermbg=none
" hi CursorLineNr term=bold cterm=none ctermfg=lightgreen ctermbg=none
" hi CursorLine ctermbg=none

" 行番号表示
set number
hi LineNr cterm=bold ctermfg=white ctermbg=none
hi CursorLineNr cterm=bold ctermfg=lightgreen ctermbg=none

" カーソルの位置を表示
set ruler

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

" カーソルの表示をモードで変更する
" let &t_SI.="\<Esc>[6 q"
" let &t_SR.="\<Esc>[4 q"
" let &t_EI.="\<Esc>[2 q"
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
let &t_SR.="\e[4 q"
" let &t_SI.="\<Esc>]50;CursorShape=1\x7"
" let &t_SR.="\<Esc>]50;CursorShape=2\x7"
" let &t_EI.="\<Esc>]50;CursorShape=0\x7"

" clipboardの有効化
" " + y でクリップボードにコピー
" set clipboard=unnamed,autoselect

" シンタックスのカラー
" set term=xterm-256color

" 背景色の設定
set background=dark

" シンタックスハイライトを有効化
syntax on

" カラースキームの設定
" colorscheme molokai
" colorscheme hybrid
" set termguicolors
" colorscheme monokai_pro
colorscheme pencil
" let g:pencil_higher_contrast_ui=0
" let g:pencil_neutral_code_bg=1
" let g:pencil_gutter_color=1
" let g:pencil_spell_undercurl=1

" カラースキームを当てたときの背景透過処理
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" lightline用設定
" scriptencoding utf-8
" set encoding=utf-8
set guifont=Ricty\ Bold:h10
" set guifontwide=Ricty=5

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

" ESC2回入力でハイライトの解除
nnoremap <Esc><Esc> :nohlsearch<CR><CR>

" <---------- keymap ---------->

" <<--------- normal --------->>

nnoremap s <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" <<--------- insert --------->>

" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>

" <<--------- Visual --------->>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>

" <<--------- Plugin --------->>

" ctrl + lを2回入力でVimShellを起動
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

" <---------- End ---------->

" <---------- Plugin Setting ---------->

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

" <---------- End ---------->

