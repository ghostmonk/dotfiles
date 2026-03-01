#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Dotfiles directory: $DOTFILES"

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for the rest of this script
  if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

echo "==> Running brew bundle..."
brew bundle --file="$DOTFILES/Brewfile"

# --- Symlinks ---
echo "==> Creating symlinks..."

link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    local bak="${dst}.bak.$(date +%Y%m%d%H%M%S)"
    echo "  backup: $dst -> $bak"
    mv "$dst" "$bak"
  fi
  ln -s "$src" "$dst"
  echo "  linked: $src -> $dst"
}

mkdir -p ~/.config

link "$DOTFILES/nvim"        ~/.config/nvim
link "$DOTFILES/sketchybar"  ~/.config/sketchybar
link "$DOTFILES/wezterm"     ~/.config/wezterm
link "$DOTFILES/aerospace.toml" ~/.aerospace.toml
link "$DOTFILES/tmux.conf"   ~/.tmux.conf
link "$DOTFILES/zshrc"       ~/.zshrc
link "$DOTFILES/zprofile"    ~/.zprofile
link "$DOTFILES/p10k.zsh"   ~/.p10k.zsh

# --- Oh My Zsh ---
echo "==> Setting up Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "  Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10k theme
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
  echo "  Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# zsh-autosuggestions
ZSH_AS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "$ZSH_AS_DIR" ]; then
  echo "  Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AS_DIR"
fi

# zsh-syntax-highlighting
ZSH_SH_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "$ZSH_SH_DIR" ]; then
  echo "  Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_SH_DIR"
fi

# --- pyenv + neovim python venv ---
echo "==> Setting up pyenv and neovim python venv..."

if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"

  # Install latest Python 3 if no versions installed (requires Xcode CLT)
  if [ -z "$(pyenv versions --bare)" ]; then
    if ! xcode-select -p &>/dev/null; then
      echo "  Xcode Command Line Tools required for pyenv. Installing..."
      xcode-select --install
      echo "  Re-run this script after Xcode CLT finishes installing."
      exit 1
    fi
    LATEST_PY=$(pyenv install --list | grep -E '^\s+3\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
    echo "  Installing Python $LATEST_PY (this may take a few minutes)..."
    pyenv install "$LATEST_PY"
    pyenv global "$LATEST_PY"
  fi

  VENV_DIR="$HOME/.virtualenvs/neovim"
  if [ ! -d "$VENV_DIR" ]; then
    echo "  Creating neovim venv at $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
  fi
  "$VENV_DIR/bin/pip" install --quiet --upgrade pip pynvim
  echo "  pynvim installed in $VENV_DIR"
else
  echo "  WARNING: pyenv not found, skipping python venv setup"
fi

# --- Global npm packages ---
echo "==> Installing global npm packages..."

if command -v npm &>/dev/null; then
  npm install -g neovim typescript typescript-language-server
else
  echo "  WARNING: npm not found, skipping global npm packages"
fi

# --- Lazy.nvim plugins ---
echo "==> Installing neovim plugins (lazy.nvim)..."

if command -v nvim &>/dev/null; then
  nvim --headless "+Lazy! sync" +qa || true
  echo "  Plugins installed"
else
  echo "  WARNING: nvim not found, skipping plugin install"
fi

# --- Build sketchybar helpers ---
echo "==> Building sketchybar helpers..."

if [ -f "$DOTFILES/sketchybar/helpers/makefile" ]; then
  make -C "$DOTFILES/sketchybar/helpers" 2>/dev/null || echo "  WARNING: sketchybar helpers build failed (may need Xcode CLT)"
fi

echo ""
echo "==> Done! Restart your terminal or run: source ~/.zshrc"
