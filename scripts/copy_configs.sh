#!/bin/bash

# Step 3: Copy configuration files from dotfiles
echo "Copying configuration files..."

mkdir -p ~/.config/alacritty
cp "$HOME/dotfiles/config/alacritty/alacritty.yml" ~/.config/alacritty/

mkdir -p ~/.config/yabai
cp "$HOME/dotfiles/config/yabai/yabairc" ~/.config/yabai/

mkdir -p ~/.config/skhd
cp "$HOME/dotfiles/config/skhd/skhdrc" ~/.config/skhd/

cp "$HOME/dotfiles/config/zsh/zshrc" ~/.zshrc
