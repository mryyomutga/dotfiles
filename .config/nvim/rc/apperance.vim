set number
set showmatch
set noshowcmd
set noshowmode
set matchtime=1
set showtabline=2
set ambiwidth=double
set list
set listchars=tab:▸\ ,trail:˽,extends:>,precedes:<,nbsp:%

" Neovim version 0.4.x
" set wildoptions=pum
" set pumblend=5

augroup nohlsearch
  autocmd!
  autocmd InsertEnter * let b:_search=@/|let @/=''
  autocmd InsertLeave * let @/=get(b:,'_search','')
augroup END

" colorscheme
set cursorline

" Hilighting double-byte space
augroup doublebyte_space
  autocmd!
  autocmd VimEnter,WinEnter * match DoubleByteSpace /　/
augroup END

colorscheme abyss
