#!/usr/bin/env bash
#
set -e

DISTRO=$(grep -E "^NAME" /etc/os-release)
DISTRO_NAME=""

echo "Installing oh-my-zsh and, neovim and devtools in Linux distro like fedora, ubuntu"
#
echo "Installing tools: git, neovim, curl, wget and devtools"
echo "detecting the Linux distribution"
# NAME="Fedora Linux"
# NAME="Ubuntu"
case "$DISTRO" in
  "NAME=\"Fedora Linux\"")
    # echo "fedora"
    DISTRO_NAME="fedora"
    ;;
  "NAME=\"Ubuntu\"")
    # echo "ubuntu"
    DISTRO_NAME="ubuntu"
    ;;
esac

if [ $DISTRO_NAME = "fedora" ]; then
    sudo dnf upgrade -y
    sudo dnf install git make zsh curl wget @development-tools -y
elif [ $DISTRO_NAME = "ubuntu" ]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install zsh curl wget build-essential git -y
fi

echo "Installing promt Starship"
curl -sS https://starship.rs/install.sh | sh

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Removing existing dotfiles"
# remove files if they already exist
rm -rf ~/.zshrc

echo "Creating symlinks ZSH"
# Symlinking files zsh
ln -srv ~/.dotfiles/zshrc ~/.zshrc

# Change the default shell to zsh
echo "Changing the default shell to zsh for future logins..."
sudo chsh -s $(which zsh) $USER

# Check if the current shell is already zsh
if [ "$SHELL" = "/usr/bin/zsh" ]; then
echo "DONE!"
else
# Change the default shell to zsh for future logins
echo "Setup complete."
echo "Log out and back in to use zsh as your default shell."
sudo chsh -s $(which zsh) $USER
fi

#Install plugins in zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo "Installing brew"
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

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
