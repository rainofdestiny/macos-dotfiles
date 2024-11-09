#!/bin/bash

# Step 4: Install Powerline fonts
if [ ! -d "$HOME/fonts" ]; then
    echo "Installing Powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts || exit
    sh install.sh
    cd ..
    rm -rf fonts
else
    echo "Powerline fonts already installed."
fi
