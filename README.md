# Dotfiles

Portable dev environment: Neovim, tmux, WezTerm, AeroSpace, and SketchyBar.

## Quick Start

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What It Does

1. Installs Homebrew (if missing)
2. Installs all packages via `Brewfile`
3. Symlinks configs to their expected locations:
   - `nvim/` -> `~/.config/nvim/`
   - `sketchybar/` -> `~/.config/sketchybar/`
   - `wezterm/` -> `~/.config/wezterm/`
   - `aerospace.toml` -> `~/.aerospace.toml`
   - `tmux.conf` -> `~/.tmux.conf`
4. Sets up pyenv + a Python venv with `pynvim`
5. Installs global npm packages (neovim, typescript, typescript-language-server)
6. Installs Neovim plugins via lazy.nvim
7. Builds sketchybar C helpers

## Notes

The `notes/` directory contains personal reference docs for AeroSpace, Neovim, SketchyBar, and tmux.

## Re-running

The install script backs up any existing config to `*.bak` before symlinking, so it's safe to re-run.
