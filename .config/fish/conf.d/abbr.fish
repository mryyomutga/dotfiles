if status --is-interactive
    set --global fish_user_abbrevitations
    abbr --add e    exit
    abbr --add g    git
    abbr --add m    mv
    abbr --add md   mkdir
    abbr --add n    nvim
    abbr --add p    'xsel -bo > '
    abbr --add r    rg
    abbr --add s    sudo
    abbr --add tr   trash
    abbr --add noto "$EDITOR ~/Documents/notes/(date +%y%m%d).md"
end
