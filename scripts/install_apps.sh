#!/bin/bash

# Step 2: Update Homebrew and install applications
echo "Updating Homebrew and installing applications..."

brew update

# Install applications
brew install mos tree fileicon
brew install --cask megasync rar amneziavpn firefox keepassxc ledger-live obsidian docker alacritty sublime-text telegram-desktop discord spotify tor-browser pycharm-ce
brew install librewolf --no-quarantine
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
