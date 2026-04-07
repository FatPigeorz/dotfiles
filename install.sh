#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Detect OS
OS="$(uname -s)"
echo "==> Detected OS: $OS"

echo "==> Installing packages..."
case "$OS" in
  Darwin)
    if ! command -v brew &>/dev/null; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install neovim ripgrep fd bat eza zoxide git-delta fzf yazi starship zellij
    ;;
  Linux)
    if command -v brew &>/dev/null; then
      brew install neovim ripgrep fd bat eza zoxide git-delta fzf yazi starship zellij
    elif command -v apt &>/dev/null; then
      echo "==> apt detected. Install packages manually or use Homebrew for Linux."
      echo "    See: https://brew.sh"
    elif command -v pacman &>/dev/null; then
      sudo pacman -S --needed neovim ripgrep fd bat eza zoxide git-delta fzf yazi starship zellij
    elif command -v dnf &>/dev/null; then
      echo "==> dnf detected. Install packages manually or use Homebrew for Linux."
    else
      echo "==> Unknown package manager. Install packages manually."
    fi
    ;;
  *)
    echo "==> Unsupported OS: $OS"
    exit 1
    ;;
esac

echo "==> Creating symlinks..."

# zsh
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc

# starship
mkdir -p ~/.config
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml

# yazi
mkdir -p ~/.config/yazi/flavors
ln -sf "$DOTFILES/yazi/theme.toml" ~/.config/yazi/theme.toml
ln -sf "$DOTFILES/yazi/yazi.toml" ~/.config/yazi/yazi.toml
cp -rn "$DOTFILES/yazi/flavors/"* ~/.config/yazi/flavors/ 2>/dev/null || true

# zellij
mkdir -p ~/.config/zellij
ln -sf "$DOTFILES/zellij/config.kdl" ~/.config/zellij/config.kdl

# git
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig

# nvim
if [ ! -d ~/.config/nvim/.git ]; then
  echo "==> Cloning nvim config..."
  git clone git@github.com:FatPigeorz/nvim_config.git ~/.config/nvim
fi

# zsh plugins
mkdir -p ~/.zsh
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

echo "==> Done! Restart your terminal or run: source ~/.zshrc"
