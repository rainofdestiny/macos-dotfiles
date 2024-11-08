#!/bin/bash

echo "Starting dotfiles installation..."

# Step 1: Check if Homebrew is installed; install it if not
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Step 2: Update Homebrew and install applications
echo "Updating Homebrew and installing applications..."

# Update Homebrew
brew update

# Install applications
brew install mos tree
brew install --cask megasync rar logitech-g-hub amneziavpn firefox keepassxc ledger-live obsidian docker alacritty sublime-text telegram-desktop discord spotify tor-browser pycharm-ce
brew install librewolf --no-quarantine
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Step 3: Copy configuration files from dotfiles
echo "Copying configuration files..."

# Create directories and copy config files for alacritty, yabai, skhd, and zsh
mkdir -p ~/.config/alacritty
cp "$HOME/dotfiles/config/alacritty/alacritty.yml" ~/.config/alacritty/

mkdir -p ~/.config/yabai
cp "$HOME/dotfiles/config/yabai/yabairc" ~/.config/yabai/

mkdir -p ~/.config/skhd
cp "$HOME/dotfiles/config/skhd/skhdrc" ~/.config/skhd/

cp "$HOME/dotfiles/config/zsh/zshrc" ~/.zshrc

# Apply Zsh configuration
echo "Applying Zsh configuration..."
source ~/.zshrc

# Step 4: Install oh-my-zsh for extended zsh configuration
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# Step 5: Install Powerline fonts
if [ ! -d "$HOME/fonts" ]; then
    echo "Installing Powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts || exit
    sh install.sh
    cd ..
    rm -rf fonts
fi

# Step 6: Start yabai and skhd services
echo "Starting yabai and skhd services..."
yabai --start-service
skhd --start-service

# Step 7: Apply system settings from dotfiles/system/

# Copy Dock settings
echo "Applying Dock settings..."
DOCK_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.dock.plist"
DOCK_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.dock.plist"
if [ -f "$DOCK_SETTINGS_SRC" ]; then
    cp "$DOCK_SETTINGS_SRC" "$DOCK_SETTINGS_DEST"
    echo "Dock settings applied."
else
    echo "Dock settings file not found."
fi

# Copy Keyboard settings
echo "Applying Keyboard settings..."
KEYBOARD_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.keyboardtype.plist"
KEYBOARD_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.keyboardtype.plist"
if [ -f "$KEYBOARD_SETTINGS_SRC" ]; then
    cp "$KEYBOARD_SETTINGS_SRC" "$KEYBOARD_SETTINGS_DEST"
    echo "Keyboard settings applied."
else
    echo "Keyboard settings file not found."
fi

# Copy Control Centre settings
echo "Applying Control Centre settings..."
CONTROL_CENTRE_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.controlcenter.plist"
CONTROL_CENTRE_SETTINGS_DEST="$HOME/Library/Preferences/com.apple.controlcenter.plist"
if [ -f "$CONTROL_CENTRE_SETTINGS_SRC" ]; then
    cp "$CONTROL_CENTRE_SETTINGS_SRC" "$CONTROL_CENTRE_SETTINGS_DEST"
    echo "Control Centre settings applied."
else
    echo "Control Centre settings file not found."
fi

# Copy Sound settings (volume and output device)
echo "Applying Sound settings..."
SOUND_SETTINGS_SRC="$HOME/dotfiles/system/com.apple.soundsettings.plist"
SOUND_SETTINGS_DEST="$HOME/Library/Preferences/ByHost/com.apple.soundsettings.plist"
if [ -f "$SOUND_SETTINGS_SRC" ]; then
    cp "$SOUND_SETTINGS_SRC" "$SOUND_SETTINGS_DEST"
    echo "Sound settings applied."
else
    echo "Sound settings file not found."
fi

# Final message
echo "Installation and configuration complete! Please restart the terminal to apply all changes."
