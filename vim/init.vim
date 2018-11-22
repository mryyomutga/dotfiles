" Last Change : Tue 20 Nov 2018 14:14:35.
" <---------- Setting ---------->

let s:base_dir = expand($HOME . '/.dotfiles/vim')

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! keymaps.vim
runtime! dein.vim
runtime! appearance.vim

runtime! script/toggle_background.vim

