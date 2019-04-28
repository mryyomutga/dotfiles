function fish_key_bindings
    bind -M insert \cr __fzf_insert_history
    bind -M insert \c_ __fzf_insert_files
    bind -M insert \cy accept-autosuggestion
    bind -M insert \cp 'history --merge; up-or-search'
    bind -M insert \cn 'history --merge; down-or-search'
end
