" Last Change : Sat 10 Nov 2018 00:14:44.
" <---------- Setting ---------->

let s:base_dir = expand('~/.dotfiles/vim')

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! keymaps.vim
runtime! dein.vim
runtime! appearance.vim

runtime! script/toggle_background.vim

