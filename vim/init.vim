" Last Change : Sun 04 Nov 2018 15:38:45.
" <---------- Setting ---------->

let s:base_dir = expand('~/.dotfiles/vim')
let s:dein_dir = s:base_dir . '/plugins'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = s:base_dir . '/toml'

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! appearance.vim
runtime! keymaps.vim
runtime! dein.vim

runtime! script/toggle_background.vim
