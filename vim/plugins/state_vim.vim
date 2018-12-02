if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/aster/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/home/aster/.vim/after,/home/aster/.dotfiles/vim/plugins/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/aster/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/aster/.dotfiles/vim/plugins'
let g:dein#_runtime_path = '/home/aster/.dotfiles/vim/plugins/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/aster/.dotfiles/vim/plugins/.cache/.vimrc'
let &runtimepath = '/home/aster/.vim,/usr/share/vim/vimfiles,/home/aster/.dotfiles/vim/plugins/repos/github.com/Shougo/vimproc.vim,/home/aster/.dotfiles/vim/plugins/repos/github.com/Shougo/dein.vim,/home/aster/.dotfiles/vim/plugins/.cache/.vimrc/.dein,/usr/share/vim/vim81,/home/aster/.dotfiles/vim/plugins/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/aster/.vim/after'
