#!/usr/bin/env bash
#
set -e

echo "Installing dependencies"
# Installing dependencies
brew install neovim
brew install node
brew install npm

echo "Creating symlinks Neovim"
# Neovim expects some folders already exist
mkdir -p ~/.config/ ~/.config/nvim/

# Symlinking files neovim
ln -srv ~/.dotfiles/nvim/* ~/.config/nvim/

# Install terminal Kitty
echo "Installing Terminal Kitty..."
sudo dnf install -y kitty

# Kitty expects some folders already exist
mkdir -p ~/.config/ ~/.config/kitty/

echo "Creating symlinks Neovim"
# Symlinking files terminal kitty
ln -srv ~/.dotfiles/kitty/* ~/.config/kitty/

# Install ranger file manager
echo "Install Ranger File Manager and Configs"
sudo dnf install ranger
sudo dnf install w3m w3m-img

echo "Creating folder for ranger"
# Create folder for ranger file manager
mkdir -p ~/.config/ ~/.config/ranger/

echo "Creating symlinks ranger files"
# Symlinking files terminal kitty
ln -srv ~/.dotfiles/ranger/* ~/.config/ranger/
