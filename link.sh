#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

link_config() {
    local source="$1"
    local target="$2"

    mkdir -p "$(dirname "$target")"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        printf 'Backing up existing %s to %s.backup\n' "$target" "$target.backup"
        mv "$target" "$target.backup"
    fi

    ln -s "$source" "$target"
    printf 'Linked %s -> %s\n' "$target" "$source"
}

link_config "$DOTFILES/.zshrc" "$HOME/.zshrc"
link_config "$DOTFILES/tmux" "$HOME/.config/tmux"
link_config "$DOTFILES/emacs/.emacs.d" "$HOME/.emacs.d"
link_config "$DOTFILES/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES/kitty" "$HOME/.config/kitty"
link_config "$DOTFILES/waybar" "$HOME/.config/waybar"

# uncomment if using sway
link_config "$DOTFILES/sway" "$HOME/.config/sway"
