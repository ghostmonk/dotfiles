# Dotfiles

Portable dev environment: Neovim, tmux, WezTerm, AeroSpace, SketchyBar, and zsh (Oh My Zsh + Powerlevel10k).

## Quick Start

```bash
git clone git@github.com:ghostmonk/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What It Does

1. Installs Homebrew (if missing)
2. Installs all packages and fonts via `Brewfile`
3. Symlinks configs to their expected locations:
   - `nvim/` -> `~/.config/nvim/`
   - `sketchybar/` -> `~/.config/sketchybar/`
   - `wezterm/` -> `~/.config/wezterm/`
   - `aerospace.toml` -> `~/.aerospace.toml`
   - `tmux.conf` -> `~/.tmux.conf`
   - `zshrc` -> `~/.zshrc`
   - `zprofile` -> `~/.zprofile`
   - `p10k.zsh` -> `~/.p10k.zsh`
4. Installs Oh My Zsh, Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting
5. Sets up pyenv + a Python venv with `pynvim`
6. Installs global npm packages (neovim, typescript, typescript-language-server)
7. Installs Neovim plugins via lazy.nvim
8. Builds sketchybar C helpers

## Local Overrides

Machine-specific config (API keys, extra PATH entries, etc.) goes in `~/.zshrc.local` — this file is sourced automatically and is not tracked by git.

## Notes

The `notes/` directory contains personal reference docs for AeroSpace, Neovim, SketchyBar, and tmux.

## Re-running

The install script backs up any existing config to `*.bak` before symlinking, so it's safe to re-run.
