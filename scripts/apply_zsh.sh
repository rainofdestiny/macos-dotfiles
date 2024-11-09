#!/bin/bash

# Step 4: Install oh-my-zsh for extended zsh configuration
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# Apply Zsh configuration if we're in Zsh
echo "Applying Zsh configuration..."
if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
    echo "Zsh configuration applied."
else
    echo "Please switch to Zsh and apply your configuration manually with: source ~/.zshrc"
fi
