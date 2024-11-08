#!/bin/sh

CONFIGS=(
  "$HOME/.config/yabai/yabairc:$HOME/dotfiles/.config/yabai/yabairc"
  "$HOME/.config/skhd/skhdrc:$HOME/dotfiles/.config/skhd/skhdrc"
  "$HOME/.config/alacritty/alacritty.toml:$HOME/dotfiles/.config/alacritty/alacritty.toml"
)

for config in "${CONFIGS[@]}"; do
  SRC_PATH="${config%%:*}"
  DEST_PATH="${config##*:}"

  mkdir -p "$(dirname "$DEST_PATH")"

  if [ -f "$SRC_PATH" ]; then
    cp "$SRC_PATH" "$DEST_PATH"
    echo "Copied $SRC_PATH -> $DEST_PATH"
  else
    echo "File $SRC_PATH not found!"
  fi
done

echo "Configuration files are grabed!"
