#!/bin/bash

echo "Starting dotfiles installation..."

# Check if Homebrew is installed; install it if not
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew and install applications
echo "Updating Homebrew and installing applications..."

# Update Homebrew
brew update

# Install applications
brew install mos tree
brew install --cask megasync rar logitech-g-hub amneziavpn firefox keepassxc ledger-live obsidian docker alacritty sublime-text telegram-desktop discord spotify tor-browser pycharm-ce
brew install librewolf --no-quarantine
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Copy configuration files
echo "Copying configuration files..."

# Create directories and copy configs
mkdir -p ~/.config/alacritty
cp "$HOME/dotfiles/config/alacritty/alacritty.yml" ~/.config/alacritty/

mkdir -p ~/.config/yabai
cp "$HOME/dotfiles/config/yabai/yabairc" ~/.config/yabai/

mkdir -p ~/.config/skhd
cp "$HOME/dotfiles/config/skhd/skhdrc" ~/.config/skhd/

cp "$HOME/dotfiles/config/zsh/zshrc" ~/.zshrc

# Apply zsh changes
source ~/.zshrc

# Install oh-my-zsh for extended zsh configuration
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# Install Powerline fonts
if [ ! -d "$HOME/fonts" ]; then
    echo "Installing Powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts || exit
    sh install.sh
    cd ..
    rm -rf fonts
fi

# Start yabai and skhd services
echo "Starting yabai and skhd services..."
yabai --start-service
skhd --start-service

echo "Installation and configuration complete! Please restart the terminal to apply all changes."
