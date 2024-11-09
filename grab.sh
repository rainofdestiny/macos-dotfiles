#!/bin/sh

CONFIGS=(
  "$HOME/.config/yabai/yabairc:$HOME/dotfiles/config/yabai/yabairc"
  "$HOME/.config/skhd/skhdrc:$HOME/dotfiles/config/skhd/skhdrc"
  "$HOME/.config/alacritty/alacritty.toml:$HOME/dotfiles/config/alacritty/alacritty.toml"
  "$HOME/.zshrc:$HOME/dotfiles/config/zsh/zshrc"
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

# Add the Dock settings to dotfiles
DOCK_SETTINGS="$HOME/Library/Preferences/com.apple.dock.plist"
DOTFILES_DOCK_PATH="$HOME/dotfiles/system/com.apple.dock.plist"

if [ -f "$DOCK_SETTINGS" ]; then
  mkdir -p "$(dirname "$DOTFILES_DOCK_PATH")"
  cp "$DOCK_SETTINGS" "$DOTFILES_DOCK_PATH"
  echo "Copied Dock settings -> $DOTFILES_DOCK_PATH"
else
  echo "Dock settings file not found!"
fi

# Add the Keyboard settings to dotfiles
KEYBOARD_SETTINGS="$HOME/Library/Preferences/com.apple.keyboardtype.plist"
DOTFILES_KEYBOARD_PATH="$HOME/dotfiles/system/com.apple.keyboardtype.plist"

if [ -f "$KEYBOARD_SETTINGS" ]; then
  mkdir -p "$(dirname "$DOTFILES_KEYBOARD_PATH")"
  cp "$KEYBOARD_SETTINGS" "$DOTFILES_KEYBOARD_PATH"
  echo "Copied Keyboard settings -> $DOTFILES_KEYBOARD_PATH"
else
  echo "Keyboard settings file not found!"
fi

# Add Control Centre settings (through System Preferences)
CONTROL_CENTRE_SETTINGS="$HOME/Library/Preferences/com.apple.controlcenter.plist"
DOTFILES_CONTROL_CENTRE_PATH="$HOME/dotfiles/system/com.apple.controlcenter.plist"

# Export relevant Control Centre settings using defaults
defaults read com.apple.controlcenter > "$DOTFILES_CONTROL_CENTRE_PATH"

if [ -f "$CONTROL_CENTRE_SETTINGS" ]; then
  mkdir -p "$(dirname "$DOTFILES_CONTROL_CENTRE_PATH")"
  cp "$CONTROL_CENTRE_SETTINGS" "$DOTFILES_CONTROL_CENTRE_PATH"
  echo "Copied Control Centre settings -> $DOTFILES_CONTROL_CENTRE_PATH"
else
  echo "Control Centre settings file not found!"
fi

# Export Sound settings
SOUND_SETTINGS="$HOME/Library/Preferences/ByHost/com.apple.soundsettings.plist"
DOTFILES_SOUND_PATH="$HOME/dotfiles/system/com.apple.soundsettings.plist"

# Export current volume level
VOLUME_LEVEL=$(osascript -e "output volume of (get volume settings)")

# Export current sound output device (e.g., speakers or headphones)
SOUND_DEVICE=$(system_profiler SPAudioDataType | grep "Output" -A 1 | grep "Device ID" | sed 's/.*Device ID: //')

mkdir -p "$(dirname "$DOTFILES_SOUND_PATH")"
echo "Volume Level: $VOLUME_LEVEL" > "$DOTFILES_SOUND_PATH"
echo "Sound Output Device ID: $SOUND_DEVICE" >> "$DOTFILES_SOUND_PATH"

echo "Copied Sound settings -> $DOTFILES_SOUND_PATH"

echo "Configuration files are grabbed!"
