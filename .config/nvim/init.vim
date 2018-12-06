" Last Change : Sun 02 Dec 2018 20:41:01.
" <---------- Setting ---------->

let s:base_dir = expand($HOME . '/.config/nvim')

" Add runtimepath
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! keymaps.vim
runtime! dein.vim
runtime! appearance.vim

runtime! script/toggle_background.vim

