" Last Change : Sun 02 Dec 2018 20:44:00.

" Leader <Space>
let mapleader="\<Space>"

" Cursor move
nnoremap j gj
nnoremap k gk
nnoremap <S-h> ^
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <S-l> $

" Buffer nav
"" edit file (new buffer)
noremap  <Leader>e :e 
"" opened buffer
nnoremap <Leader>bo :b 
"" close buffer
noremap  <Leader>c :bdelete<CR>
"" show buffer list
noremap  <silent> <Leader>bl :buffers<CR>

" noremap <Leader>n :bnext<CR>
" noremap <Leader>m :bprevious<CR>

"" Buffer move
noremap  <Leader>q  :bnext<CR>
noremap  <Leader>z  :bnext<CR>
noremap  <Leader>w  :bprevious<CR>
noremap  <Leader>x  :bprevious<CR>

" Tabs nav
nnoremap <Tab> gt
nnoremap <S-Tab> gT
"" Tab open file
noremap  <Leader>te :tabe 
"" Tab open none
noremap  <silent> <S-t> :tabnew<CR>

" Windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap  <Leader>ga  :Gwrite<CR>
noremap  <Leader>gr  :Gread<CR>
noremap  <Leader>gc  :Gcommit<CR>
noremap  <Leader>gsh :Gpush<CR>
noremap  <Leader>gll :Gpull<CR>
noremap  <Leader>gs  :Gstatus<CR>
noremap  <Leader>gb  :Gblame<CR>
noremap  <Leader>gd  :Gvdiff<CR>
noremap  <Leader>grm :Gremove<CR>
nnoremap <Leader>go  :.Gbrowse<CR>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" NoHighlight
nnoremap <silent><Esc><Esc> :nohlsearch<CR>

" NERDTree
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" launch quickrun
" nmap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" Nop Cursor keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>

" Exit from Insert mode when input jj in Insert mode
inoremap <silent> jj <Esc>

" Terminal
tnoremap <Esc> <C-\><C-n>
