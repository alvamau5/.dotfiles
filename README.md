# Alvamau5's Dotfiles

```
config/    — dotfiles that get symlinked (zshrc, nvim, ghostty, tmux, etc.)
setup/     — machine provisioning scripts (macos, fedora)
install.sh   — entrypoint (detects OS, runs the right installer)
```

## Bootstrap

### macOS

```bash
xcode-select --install
git clone https://github.com/alvamau5/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && bash install.sh
```

### Fedora

```bash
sudo dnf install -y git gh
gh auth login --web --git-protocol ssh
gh repo clone alvamau5/.dotfiles ~/.dotfiles
cd ~/.dotfiles && bash install.sh
```
