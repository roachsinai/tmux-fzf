#!/usr/bin/env bash

FZF_DEFAULT_OPTS=$(echo $FZF_DEFAULT_OPTS | sed -E -e '$a --header="select a colorscheme"')
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

colorschemes_dir=~/.tmux/tmuxline
target=$(find $colorschemes_dir -type f -printf '%f\n' | sed '1i [cancel]' | eval "$CURRENT_DIR/.fzf-tmux $TMUX_FZF_OPTIONS")

[[ "$target" == "[cancel]" || -z "$target" ]] && exit

tmux source-file $colorschemes_dir/$target
tmux run-shell ~/.tmux/plugins/tmux-prefix-highlight/prefix_highlight.tmux
