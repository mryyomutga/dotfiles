let g:loaded_netrw = 1

" minpac
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type':'opt'})

  call minpac#add('soramugi/auto-ctags.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('cohama/lexima.vim')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('kana/vim-textobj-user')  "isb/asb
  call minpac#add('vimtaku/vim-textobj-sigil') "yag
  call minpac#add('fvictorio/vim-textobj-backticks')
  " call minpac#add('w0rp/ale')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('tyru/caw.vim')
  call minpac#add('simeji/winresizer')
  call minpac#add('vim-scripts/autodate.vim')

  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/vim-lsp')
  " call minpac#add('prabirshrestha/asyncomplete.vim')
  " call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('ryanolsonx/vim-lsp-python')
  " call minpac#add('prabirshrestha/asyncomplete-neosnippet.vim')
endif
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" auto-ctags
let g:auto_ctags = 0
let g:auto_ctags_directory_list = ['.git']

" lightline
let g:lightline = {
      \   'colorscheme': 'deepocean',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ] ],
      \     'right': [ ['filetype'], ['fileformat'], ['fileencoding', 'syntaxcheck'] ],
      \   },
      \   'tabline': {
      \     'filename': 'tabs',
      \     'right': [[]],
      \   },
      \   'component': {
      \     'filetype': '%{&ft!=#""?&ft:"-"}',
      \     'paste': '%{&paste?"P":""}',
      \   },
      \   'component_expand': {
      \     'syntaxcheck': 'plugin#lightline#syntaxcheck',
      \   },
      \   'component_type': {
      \     'syntaxcheck': 'error',
      \   },
      \   'component_function': {
      \     'filetype':'LightlineFiletype',
      \     'fileformat':'LightlineFileformat',
      \     'fileencoding':'LightlineFileencoding',
      \     'mode': 'LightlineMode',
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

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" 'lineinfo': '%3l:%2v',
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" openbrowser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-lsp
" let g:lsp_async_completion = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand("$HOME/.config/nvim/log/vim-lsp.log")
let g:asyncomplete_log_file = expand("$HOME/.config/nvim/log/asyncomplete.log")

" Go
" if executable('gopls')
"   augroup LspGo
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"     \ 'name':'gopls',
"     \ 'cmd':{server_info->['gopls', '-mode', 'stdio']},
"     \ 'whitelist':['go'],
"     \})
"     autocmd FileType go setlocal omnifunc=lsp#complete
"   augroup END
" endif
if executable('go-langserver')
  augroup LspGo
    au!
    au User lsp_setup call lsp#register_server({
       \ 'name': 'go-langserver',
       \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
       \ 'whitelist': ['go'],
       \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif
" Python
if executable('pyls')
  augroup LspPython
    au!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name':'pyls',
      \ 'cmd':{server_info->['pyls']},
      \ 'whitelist':['python'],
      \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
  augroup END
endif
" C/C++
if executable('clangd')
  augroup LspClang
  au!
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ })
  autocmd FileType c setlocal omnifunc=lsp#complete
  autocmd FileType cpp setlocal omnifunc=lsp#complete
  autocmd FileType objc setlocal omnifunc=lsp#complete
  autocmd FileType objcpp setlocal omnifunc=lsp#complete
  augroup END
endif

" vim-lsp keymaps
nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>p :LspHover<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>s :split \| :LspDefinition<CR>
nnoremap <silent> <Leader>v :vsplit \| :LspDefinition<CR>

" asyncomplete.vim
" let g:asyncomplete_remove_duplicates = 1
" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_auto_popup = 1

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" caw
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" ale
" let g:ale_linters = {}
" let g:ale_linters['go'] = ['gofmt', 'golint']
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier', 'eslint']
" let g:ale_fixers['json'] = ['prettier']
" let g:ale_fixers['yaml'] = ['prettier']
" let g:ale_fixers['vue'] = ['prettier', 'eslint', 'stylelint']
" let g:ale_fixers['css'] = ['prettier', 'stylelint']
" let g:ale_fixers['go'] = ['goimports']
" let g:ale_fixers['hcl'] = [
"      \   {buffer, lines -> {'command': 'hclfmt -w %t', 'read_temporary_file': 1}}
"      \   ]
" let g:ale_fixers['terraform'] = [
"      \   {buffer, lines -> {'command': 'terraform fmt %t', 'read_temporary_file': 1}}
"      \   ]
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_markdown_mdl_options = '--ignore-front-matter'
" let g:ale_set_highlights = 0
" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '•'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
" nmap <silent> <Space><C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <Space><C-j> <Plug>(ale_next_wrap)
"
" augroup ale
"   autocmd!
"   autocmd User ALELint call lightline#update()
"   autocmd FileType zsh let g:ale_sh_shell_default_shell = 'zsh'
" augroup END

" autodate.vim
let g:autodate_lines = 20
let g:autodate_keyword_pre = 'Last Change :'
let g:autodate_format = '%a %d %b %Y %H:%M:%S'

" winresizer
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
