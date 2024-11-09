#!/bin/bash

echo "Update icons..."

sudo fileicon set /Applications/Firefox.app ~/macos-dotfiles/icons/firefox.icns
sudo fileicon set /Applications/AmneziaVPN.app ~/macos-dotfiles/icons/amnezia.icns
sudo fileicon set /Applications/Alacritty.app  ~/macos-dotfiles/icons/alacritty.icns
sudo fileicon set /Applications/PyCharm\ CE.app ~/macos-dotfiles/icons/pycharm.icns
sudo fileicon set /Applications/Spotify.app ~/macos-dotfiles/icons/spotify.icns

killall Dock

echo "Updating icons complete!"