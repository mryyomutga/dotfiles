let g:loaded_netrw = 1

" minpac
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type':'opt'})

  call minpac#add('soramugi/auto-ctags.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('cohama/lexima.vim')
  call minpac#add('kana/vim-textobj-user')  "isb/asb
  call minpac#add('vimtaku/vim-textobj-sigil') "yag
  call minpac#add('fvictorio/vim-textobj-backticks')
  call minpac#add('w0rp/ale')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('Shougo/neosnippet')
  call minpac#add('tyru/caw.vim')

  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('prabirshrestha/vim-lsp')
endif
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" auto-ctags
let g:auto_ctags = 0
let g:auto_ctags_directory_list = ['.git']

" lightline
let g:lightline = {
      \   'colorscheme': 'abyss',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ] ],
      \     'right': [ ['filetype'], ['fileformat', 'fileencoding', 'syntaxcheck']],
      \   },
      \   'tabline': {
      \     'filename': 'tabs',
      \     'right': [[]],
      \   },
      \   'component': {
      \     'lineinfo': '%-2v',
      \     'filetype': '%{&ft!=#""?&ft:"-"}',
      \     'paste': '%{&paste?"P":""}',
      \   },
      \   'component_expand': {
      \     'syntaxcheck': 'plugin#lightline#syntaxcheck',
      \   },
      \   'component_type': {
      \     'syntaxcheck': 'error',
      \   },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-L',
      \     "\<C-v>": 'V-B',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-L',
      \     "\<C-s>": 'S-B',
      \     't': 'T',
      \   },
      \   'separator': {
      \     'left': "\ue0b0",
      \     'right': "\ue0b2",
      \   },
      \   'subseparator': {
      \     'left': "\ue0b1",
      \     'right': "\ue0b3",
      \   },
      \ }

" openbrowser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-lsp
"" lsp async completion
let g:lsp_async_completion = 1

" go-lsp
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" caw
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier', 'eslint', 'stylelint']
let g:ale_fixers['css'] = ['prettier', 'stylelint']
let g:ale_fixers['go'] = ['goimports']
let g:ale_fixers['hcl'] = [
      \   {buffer, lines -> {'command': 'hclfmt -w %t', 'read_temporary_file': 1}}
      \   ]
let g:ale_fixers['terraform'] = [
      \   {buffer, lines -> {'command': 'terraform fmt %t', 'read_temporary_file': 1}}
      \   ]
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_markdown_mdl_options = '--ignore-front-matter'
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <Space><C-k> <Plug>(ale_previous_wrap)
nmap <silent> <Space><C-j> <Plug>(ale_next_wrap)

augroup ale
  autocmd!
  autocmd User ALELint call lightline#update()
  autocmd FileType zsh let g:ale_sh_shell_default_shell = 'zsh'
augroup END



