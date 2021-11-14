# Before start plugins
zinit depth=1 light-mode for \
    romkatv/powerlevel10k \
    jeffreytse/zsh-vi-mode \
    OMZL::history.zsh \
    zsh-users/zsh-autosuggestions 

# After start plugins
zinit depth=1 wait lucid light-mode for \
    ajeetdsouza/zoxide \
    zsh-users/zsh-completions \
    OMZP::fzf \
    Aloxaf/fzf-tab 

# Must be the last plugin loaded
zinit ice wait lucid atinit"zpcompinit;zpcdreplay"; zinit light zdharma/fast-syntax-highlighting
