command! -nargs=0 ToggleBackground call s:Background()
function! Background()
    let s:background_tp=1
    if s:background_tp == 0
        " カラースキームの設定
        colorscheme iceberg

        " カーソル位置に下線を引く
        set cursorline
        set cursorcolumn
        hi CursorLine term=underline cterm=bold ctermbg=235
        hi CursorColumn term=underline ctermbg=235
        augroup exit_write_mode
            autocmd!
            autocmd InsertEnter * hi CursorLine term=none cterm=bold ctermbg=none
            autocmd InsertEnter * hi CursorColumn term=none ctermbg=none
            autocmd InsertLeave * hi CursorLine term=underline cterm=bold ctermbg=235
            autocmd InsertLeave * hi CursorColumn term=underline ctermbg=235
        augroup END

        " 行番号表示
        set number
        hi LineNr ctermbg=none ctermfg=239
        " hi LineNr cterm=none ctermbg=none ctermfg=green
        hi CursorLineNr cterm=bold ctermfg=69 ctermbg=none

        " カーソルの位置を表示
        set ruler

        " カラースキームを当てたときの背景透過処理
        " highlight Normal ctermbg=none
        " highlight NonText ctermbg=none
        " highlight LineNr ctermbg=none
        " highlight Folded ctermbg=none
        " highlight EndOfBuffer ctermbg=none

        " カーソルの表示をモードで変更する
        let &t_SI.="\e[5 q"
        let &t_EI.="\e[2 q"
        let &t_SR.="\e[4 q"
        let s:background_tp=1
    else
        " 背景の透過処理
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
        highlight LineNr ctermbg=none
        highlight Folded ctermbg=none
        highlight EndOfBuffer ctermbg=none
        let s:background_tp=0
    endif
endfunction

