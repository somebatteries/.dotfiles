__fzf_cd_git__() {
  local dir
  dir=$(git submodule foreach --quiet 'echo $sm_path' | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m) && printf 'cd -- %q' "$dir"
}

# ALT-D - Descend into the selected git directory
bind -m emacs-standard '"\ed": " \C-b\C-k \C-u`__fzf_cd_git__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"\ed": "\C-z\ed\C-z"'
bind -m vi-insert '"\ed": "\C-z\ed\C-z"'
