" Last Change : Sun 04 Nov 2018 15:40:29.
" カーソル移動系
nmap j gj
nmap k gk
nmap <S-h> ^
nmap <S-j> }
nmap <S-k> {
nmap <S-l> $

nmap s <Nop>

nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Right> <Nop>
nmap <Left> <Nop>

" Ctrl + h & lでタブの移動
nmap <C-l> gt
nmap <C-h> gT

" 水平分割
nmap ss :split<CR> <C-w><C-w>
" 垂直分割
nmap sv :vsplit<CR> <C-w><C-w>

" 背景の透過切り替え
" nmap tp :ToggleBackground<CR>

" ESC2回入力でハイライトの解除
nmap <Esc><Esc> :nohlsearch<CR><CR>

" <<--------- insert --------->>

" imap <C-k> <Up>
" imap <C-j> <Down>
" imap <C-h> <Left>
" imap <C-l> <Right>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Right> <Nop>
imap <Left> <Nop>

" <<--------- Visual --------->>

vmap <Up> <Nop>
vmap <Down> <Nop>
vmap <Right> <Nop>
vmap <Left> <Nop>

