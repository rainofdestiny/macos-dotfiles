#!/bin/bash

# Step 7: Apply system settings from dotfiles/system/

# Dock settings
echo "Applying Dock settings..."
DOCK_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.dock.plist"
DOCK_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.dock.plist"
if [ -f "$DOCK_SETTINGS_SRC" ]; then
    cp "$DOCK_SETTINGS_SRC" "$DOCK_SETTINGS_DEST"
    echo "Dock settings applied."
    killall Dock
else
    echo "Dock settings file not found."
fi

# Keyboard settings
echo "Applying Keyboard settings..."
KEYBOARD_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.keyboardtype.plist"
KEYBOARD_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.keyboardtype.plist"
if [ -f "$KEYBOARD_SETTINGS_SRC" ]; then
    cp "$KEYBOARD_SETTINGS_SRC" "$KEYBOARD_SETTINGS_DEST"
    echo "Keyboard settings applied."
else
    echo "Keyboard settings file not found."
fi

# Control Centre settings
echo "Applying Control Centre settings..."
CONTROL_CENTRE_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.controlcenter.plist"
CONTROL_CENTRE_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.controlcenter.plist"
if [ -f "$CONTROL_CENTRE_SETTINGS_SRC" ]; then
    cp "$CONTROL_CENTRE_SETTINGS_SRC" "$CONTROL_CENTRE_SETTINGS_DEST"
    echo "Control Centre settings applied."
else
    echo "Control Centre settings file not found."
fi

# Sound settings
echo "Applying Sound settings..."
SOUND_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.soundsettings.plist"
SOUND_SETTINGS_DEST="$HOME/Library/Preferences/ByHost/com.apple.soundsettings.plist"
if [ -f "$SOUND_SETTINGS_SRC" ]; then
    cp "$SOUND_SETTINGS_SRC" "$SOUND_SETTINGS_DEST"
    echo "Sound settings applied."
else
    echo "Sound settings file not found."
fi
