"      _       _ __        _
"     (_)___  (_) /__   __(_)___ ___
"    / / __ \/ / __/ | / / / __ `__ \
"   / / / / / / /__| |/ / / / / / / /
"  /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Last Change : Fri 14 Dec 2018 02:04:47.
" <---------- Setting ---------->
filetype off
filetype plugin indent off

scriptencoding utf-8

" Declare rc_vim_list and source_rc
let s:rc_vim_list = [
\   'base',
\   'apperance',
\   'keymaps',
\   'plugins',
\ ]

" Source settings
" Location: ~/.config/nvim/rc
for s:rc_vim in s:rc_vim_list
    call source#rc(s:rc_vim)
endfor

filetype plugin indent on
syntax enable
