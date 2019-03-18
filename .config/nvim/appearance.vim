" Last Change : Thu 31 Jan 2019 15:45:28.
" Use 256 color on terminal
if !has('gui_running')
    set t_Co=256
endif

" Show Ambiguous width characters
set ambiwidth=double

" Show title
set title

" Show typing command
set showcmd

" Punctuate match brackets
set showmatch

" Show always statusline
set laststatus=2

" Show invisible characters
set list
" set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%

" Set background
set background=dark

" Show cursor position on statusline
set ruler

" Colorscheme
" colorscheme molokai
" colorscheme hybrid
" colorscheme Benokai
" colorscheme monokai_pro
colorscheme iceberg
set termguicolors
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"


" Show line numbers
set number
" hi LineNr cterm=none ctermbg=none ctermfg=250
" hi CursorLineNr ctermfg=lightblue ctermbg=none

" Set popup menu's color
" highlight Pmenu ctermfg=46 ctermbg=0
" highlight PmenuSel cterm=bold ctermfg=51 ctermbg=8
" highlight PmenuSbar ctermbg=8
" highlight PmenuThumb ctermfg=7

" Show cursor line and column
set cursorline
" set cursorcolumn

" augroup exit_write_mode
"     autocmd!
"     " autocmd InsertEnter * hi CursorLine term=none ctermbg=none
"     " autocmd InsertEnter * hi CursorColumn term=none ctermbg=none
"     " autocmd InsertLeave * hi CursorLine term=underline ctermbg=235
"     " autocmd InsertLeave * hi CursorColumn term=underline ctermbg=235
"     autocmd InsertEnter * set nocursorcolumn
"     autocmd InsertLeave * set cursorcolumn
" augroup END

" highlight CursorLine cterm=none ctermbg=none
" highlight Normal cterm=none ctermbg=none
" highlight NonText cterm=none ctermbg=none
" highlight LineNr cterm=none ctermbg=none
" highlight Folded cterm=none ctermbg=none
" highlight EndOfBuffer cterm=none ctermbg=none
" highlight Pmenu ctermbg=none
" highlight PmenuSel ctermbg=none
" highlight PmenuSbar ctermbg=none
" highlight PmenuThumb ctermfg=none ctermbg=none

" highlight TabLineSel ctermbg=245
" highlight TabLine ctermbg=240
" highlight TabLineFill ctermbg=235

" Change cursor shape by mode
if !has('nvim')
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[2 q"
    let &t_SR.="\e[4 q"
endif
