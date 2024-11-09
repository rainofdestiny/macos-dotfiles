#!/bin/bash

echo "Starting dotfiles installation..."

# Запуск отдельных скриптов
source ./scripts/homebrew.sh
source ./scripts/install_apps.sh
source ./scripts/copy_configs.sh
source ./scripts/install_fonts.sh
source ./scripts/apply_system_settings.sh
source ./scripts/apply_zsh.sh
source ./scripts/install_zsh_plugins.sh
source ./scripts/set_icons.sh

echo "Installation and configuration complete! Please restart the terminal to apply all changes."
