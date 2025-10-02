#!/usr/bin/env bash

# Function to keep updating the sudo timestamp until the script ends
keep_sudo_alive() {
	while true; do
		sudo -n true
		sleep 60
	done 2>/dev/null &
}

# Function to check if a command exists
check_command() {
    local cmd="$1"
    command -v "$cmd" &> /dev/null
}

install_brew() {
  if ! check_command brew; then
    echo "Installing Brew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      if [[ $os_type == "Linux" ]]; then
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      fi
  fi
}

create_symlinks() {
    echo "Removing existing dotfiles..."
    rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.config/nvim ~/.ideavimrc ~/.wezterm.lua ~/.config/starship.toml	2>/dev/null

    echo "Creating symlinks..."
    mkdir -p ~/projects ~/.config

    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/nvim ~/.config/nvim
    ln -s ~/.dotfiles/ghostty ~/.config/ghostty
    ln -s ~/.dotfiles/yazi ~/.config/yazi.toml

}

install_brew_packages() {
echo "Installing packages brew"
	    brew update

     	brew install neovim
     	brew install nvm   
     	brew install node
     	brew install npm
     	brew install gh
     	brew install starship
	    brew install zsh-autosuggestions
	    brew install zsh-syntax-highlighting
      	brew install zsh-completions
      	brew install yazi ffmpegthumbnailer ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font

	if ! check_command fzf; then
		brew install fzf
		# Add FZF shortcuts
		"$(brew --prefix)"/opt/fzf/install
	fi
}

install_brew_cask_packages() {
	brew install --cask whatsapp
	brew install --cask ghostty
}

setup_linux() {
	echo -e "Using specific config for Linux \n"

	# update OS
	# sudo dnf upgrade -y

	sudo dnf install -y zsh curl wget git
	sudo dnf5 install @development-tools -y

	create_symlinks

	# Install Fonts
	mkdir -p ~/.local/share/fonts
	echo "Installing Cascadia"
	wget -qO- $(curl -s https://api.github.com/repos/microsoft/cascadia-code/releases/latest | grep browser_download_url | grep zip | cut -d '"' -f 4) -O cascadia.zip
	unzip -o cascadia.zip -d ~/.local/share/fonts
	rm cascadia.zip
	fc-cache -fv

	install_brew
	install_starship
	install_brew_packages

	# Check if the current shell is already zsh
	if [[ "$SHELL" == *"zsh" ]]; then
	    echo "ZSH is the default shell."
	else
	    # Get the path of zsh
	    zsh_path=$(which zsh)

	    # Change the default shell to zsh for future logins
	    echo "Setting up zsh as your default shell..."
	    if chsh -s "$zsh_path"; then
		echo "Setup complete. Log out and back in to start using zsh as your default shell."
	    else
		echo "Error: Failed to change the default shell."
		echo "Please try running 'chsh -s $(which zsh)' manually."
	    fi
	fi
}

setup_mac() {
	echo -e "Using specific config for Mac \n"

	create_symlinks

	install_brew

	brew tap homebrew/cask-fonts

	# casks only work in mac
	echo "Installing Caskaydia"
        brew install --cask font-caskaydia-cove-nerd-font

	brew install reattach-to-user-namespace

	install_brew_packages
	install_brew_cask_packages
}

setup_bluefin() {
	echo -e "Using specific config for Bluefin \n"

	create_symlinks

	install_brew_packages

	ujust shell zsh

	ujust dx-group # setup user and permissions for docker
}


os_type=""

if check_command ujust; then
    os_type="Bluefin"
elif [[ $(uname) == "Darwin" ]]; then
    os_type="Mac"
else
    os_type="Linux"
fi

echo -e "$os_type detected. Using $os_type config... \n"

# Ask for the administrator password upfront and keep the sudo timestamp updated
#sudo -v

# keep_sudo_alive

case $os_type inee
    "Bluefin")
        setup_bluefin
        ;;
    "Mac")
        setup_mac
        ;;
    "Linux")
        setup_linux
        ;;
    *)
        echo "Unknown OS type: $os_type. Exiting."
        exit 1
        ;;
esac
