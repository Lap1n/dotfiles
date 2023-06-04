# Before start plugins
zinit depth=1 light-mode for \
    romkatv/powerlevel10k \
    jeffreytse/zsh-vi-mode \
    OMZL::history.zsh \
    zsh-users/zsh-autosuggestions  \
		catppuccin/zsh-syntax-highlighting

# After start plugins
zinit depth=1 wait lucid light-mode for \
    ajeetdsouza/zoxide \
    zsh-users/zsh-completions \
    OMZP::fzf \
    Aloxaf/fzf-tab \
		wfxr/forgit \
    bckim92/zsh-autoswitch-conda

# Must be the last plugin loaded
zinit ice wait lucid atinit"zpcompinit;zpcdreplay"; zinit light zsh-users/zsh-syntax-highlighting
