" Last Change : Thu 15 Nov 2018 18:43:35.
" <---------- dein ---------->
set nocompatible

filetype plugin indent off
syntax off

" Required:
let g:python_host_prog =  $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

let s:base_dir = expand('~/.dotfiles/vim')
let s:dein_dir = s:base_dir . '/plugins'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = s:base_dir . '/toml'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml(s:toml_dir . '/general.toml',     {'lazy':0})
    call dein#load_toml(s:toml_dir . '/colorscheme.toml', {'lazy':0})
    call dein#load_toml(s:toml_dir . '/nerdtree.toml',    {'lazy':0})
    call dein#load_toml(s:toml_dir . '/lightline.toml',   {'lazy':0})
    call dein#load_toml(s:toml_dir . '/neovim.toml',      {'lazy':0})
    call dein#load_toml(s:toml_dir . '/completion.toml',  {'lazy':0})
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('dzhou121/gonvim-fuzzy')
    call dein#add('equalsraf/neovim-gui-shim')
    call dein#end()
    call dein#save_state()
endif

" If there are the plugins that has not been installed on startup,
" dein is checking and installing.

if dein#check_install()
    call dein#install()
endif

" Required:
filetype plugin indent on

syntax on

