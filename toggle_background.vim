command! -nargs=0 ToggleBackground call s:Background()

let s:background_tp=1

function! s:Background()
    if s:background_tp == 0
        " カラースキームの設定
        colorscheme molokai

        " カーソル位置に下線を引く
        set cursorline
        " hi clear CursorLine
        hi CursorLine cterm=bold ctermfg=none
        " augroup exit_write_mode
        "     autocmd!
        "     autocmd InsertEnter * hi CursorLine cterm=none ctermfg=none
        "     autocmd InsertLeave * hi CursorLine cterm=underline ctermfg=none
        " augroup END
        " hi CursorLine term=reverse cterm=none
        " hi CursorLineNr ctermfg=199
        hi CursorLineNr term=none cterm=bold ctermfg=darkblue

        " 行番号表示
        set number
        hi LineNr cterm=none ctermbg=none ctermfg=250
        " hi CursorLineNr cterm=bold ctermfg=lightgreen ctermbg=none

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

