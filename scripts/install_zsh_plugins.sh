#!/bin/bash

ZSHRC_FILE="$HOME/.zshrc"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"

if [[ ! -f $ZSHRC_FILE ]]; then
    echo "File .zshrc not found!"
    exit 1
fi

plugins=$(grep '^plugins=' "$ZSHRC_FILE" | sed -E "s/plugins=\((.*)\)/\1/")

IFS=' ' read -r -a plugins_array <<< "$plugins"


for plugin in "${plugins_array[@]}"; do
    if [[ ! -d "$ZSH_CUSTOM/$plugin" ]]; then
        echo "Install plugin $plugin..."
        git clone "https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/$plugin" "$ZSH_CUSTOM/$plugin"
    else
        echo "Plugin $plugin is already installed."
    fi
done
