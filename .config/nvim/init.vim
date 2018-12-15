"      _       _ __        _
"     (_)___  (_) /__   __(_)___ ___
"    / / __ \/ / __/ | / / / __ `__ \
"   / / / / / / /__| |/ / / / / / / /
"  /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Last Change : Fri 14 Dec 2018 02:04:47.
" <---------- Setting ---------->

let s:base_dir = expand($HOME . '/.config/nvim')

" Add runtimepath
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! keymaps.vim
runtime! dein.vim
runtime! appearance.vim

runtime! script/toggle_background.vim

