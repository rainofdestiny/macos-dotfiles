#!/bin/bash

echo "Update icons..."

sudo fileicon set /Applications/Firefox.app ~/dotfiles/icons/firefox.icns
sudo fileicon set /Applications/AmneziaVPN.app ~/dotfiles/icons/amnezia.icns
sudo fileicon set /Applications/Alacritty.app  ~/dotfiles/icons/alacritty.icns
sudo fileicon set /Applications/PyCharm\ CE.app ~/dotfiles/icons/pycharm.icns
sudo fileicon set /Applications/Spotify.app ~/dotfiles/icons/spotify.icns
sudo fileicon set /Applications/Telegram\ Desktop.app ~/dotfiles/icons/telegram.icns

killall Dock

echo "Updating icons complete!"