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

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing powerlevel10k"
if [ -d ${p10kdir} ]
then
echo "the direcotry exists: ${p10kdir}"
else
echo -e "the direcotry do not exists\ncloning the repository"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${p10kdir}
fi
echo "adding theme powrlevel10k in .zshrc"
sed -i -E 's/^ZSH_THEME=.+/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ${HOME}/.zshrc

echo "Creating symlinks"
# Neovim expects some folders already exist
mkdir -p ~/.config/ ~/.config/nvim/

# Symlinking files
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/nvim/* ~/.config/nvim/

echo "Installing brew"
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

echo "Installing dependencies"
# Installing dependencies
brew install neovim
brew install node
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install starship

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
