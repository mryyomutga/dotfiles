" Last Change : Sun 02 Dec 2018 16:27:47.
" カーソル移動系

" Leaderを<Space>にする
let mapleader="\<Space>"

nnoremap j gj
nnoremap k gk
nnoremap <S-h> ^
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <S-l> $

" nmap s <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" <Tab> でタブの移動
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Ctrl + hjklでウィンドウの移動
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" 水平分割
noremap <Leader>h :<C-u>split<CR>
" 垂直分割
noremap <Leader>v :<C-u>vsplit<CR>

" 背景の透過切り替え
" nmap tp :ToggleBackground<CR>

" ESC2回入力でハイライトの解除
nnoremap <silent><Esc><Esc> :nohlsearch<CR>

" NERDTreeのトグル
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" quickrunの実行
" nmap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" imap <C-k> <Up>
" imap <C-j> <Down>
" imap <C-h> <Left>
" imap <C-l> <Right>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>

nnoremap <Leader>c :e 
nnoremap <Leader>n :bNext<CR>
nnoremap <Leader>m :bprevious<CR>
inoremap <silent> jj <Esc>

tnoremap <Esc> <C-\><C-n>
