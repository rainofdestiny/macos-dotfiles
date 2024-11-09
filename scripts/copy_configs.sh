#!/bin/bash

# Step 3: Copy configuration files from dotfiles
echo "Copying configuration files..."

mkdir -p ~/.config/alacritty
cp "$HOME/macos-dotfiles/config/alacritty/alacritty.toml" ~/.config/alacritty/

mkdir -p ~/.config/yabai
cp "$HOME/macos-dotfiles/config/yabai/yabairc" ~/.config/yabai/

mkdir -p ~/.config/skhd
cp "$HOME/macos-dotfiles/config/skhd/skhdrc" ~/.config/skhd/

cp "$HOME/macos-dotfiles/config/zsh/zshrc" ~/.zshrc
