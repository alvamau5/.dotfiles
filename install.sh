#! bin/bash
#
set -e

if [[ $(uname) == "Linux"]]; then
        echo "Linux detectado. Usando configuracion Linux"
        # Distro indentificacion
        . /etc/os-release
        if [[ $NAME == "Fedora" ]]; then
          echo "Updating system package (Fedora)..."
          sudo dnf upgrade -y
          sudo dnf install git zsh curl wget @development-tools
        elif [[ $NAME == "Ubuntu" ]]; then
          echo "Updating system packages (Ubuntu)..."
          sudo apt update && sudo apt upgrade -y
          sudo apt install zsh curl wget build-essential git -y
        fi
fi

echo "Installing promt Starship"
curl -sS https://starship.rs/install.sh | sh


echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Creating symlinks Neovim"
# Neovim expects some folders already exist
mkdir -p ~/.config/ ~/.config/nvim/

# Symlinking files neovim
ln -s ~/dotfiles/nvim/* ~/.config/nvim/

echo "Installing brew"
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

echo "Installing dependencies"
# Installing dependencies
brew install neovim
brew install node

echo "Removing existing dotfiles"
# remove files if they already exist
rm -rf ~/.zshrc

echo "Creating symlinks ZSH"
# Symlinking files zsh
ln -s ~/dotfiles/zshrc ~/.zshrc

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

# Install terminal Kitty
echo "Installing Terminal Kitty..."
sudo dnf install -y kitty

# Kitty expects some folders already exist
mkdir -p ~/.config/ ~/.config/kitty/

echo "Creating symlinks Neovim"
# Symlinking files terminal kitty
ln -s ~/dotfiles/kitty/* ~/.config/kitty/
