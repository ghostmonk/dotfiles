# Dotfiles

Portable dev environment: Neovim, tmux, WezTerm, AeroSpace, SketchyBar, and zsh (Oh My Zsh + Powerlevel10k).

## Quick Start

```bash
git clone git@github.com:ghostmonk/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What It Does

1. **Homebrew** — installs Homebrew if missing
2. **Packages** — installs all formulae, casks, and fonts via `Brewfile`:
   - Core: git, neovim, tmux, lazygit
   - Search: ripgrep, fd, tree-sitter
   - CLI: figlet, jp2a
   - Languages: lua, node, pyenv
   - Casks: WezTerm, AeroSpace
   - Fonts: Meslo LG Nerd Font, Hack Nerd Font
   - SketchyBar (via FelixKratz/formulae tap)
3. **Symlinks** — links configs to their expected locations:
   - `nvim/` → `~/.config/nvim/`
   - `sketchybar/` → `~/.config/sketchybar/`
   - `wezterm/` → `~/.config/wezterm/`
   - `aerospace.toml` → `~/.aerospace.toml`
   - `tmux.conf` → `~/.tmux.conf`
   - `zshrc` → `~/.zshrc`
   - `zprofile` → `~/.zprofile`
   - `p10k.zsh` → `~/.p10k.zsh`
4. **Notes** — copies reference docs from `notes/` to `~/Documents/notes/`
5. **Oh My Zsh** — installs Oh My Zsh, Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting
6. **Python** — sets up pyenv, installs latest Python 3, creates a neovim venv with `pynvim`
7. **Node** — installs global npm packages (neovim, typescript, typescript-language-server)
8. **Neovim plugins** — syncs plugins via lazy.nvim
9. **SbarLua** — clones and builds the Lua module for SketchyBar (`~/.local/share/sketchybar_lua/`)
10. **SketchyBar helpers** — builds the C helper binaries

## Post-Install

After running `install.sh`, start the services:

1. **Open AeroSpace** — launch from `/Applications/AeroSpace.app` or Spotlight. This also starts SketchyBar automatically. AeroSpace is configured to start at login for future sessions.
2. **Open WezTerm** — launch from `/Applications/WezTerm.app` or Spotlight.
3. **Restart your shell** — open a new terminal tab or run `source ~/.zshrc`.

## Local Overrides

Machine-specific config (API keys, extra PATH entries, etc.) goes in `~/.zshrc.local` — this file is sourced automatically and is not tracked by git.

## Notes

The `notes/` directory contains personal reference docs for AeroSpace, Neovim, SketchyBar, and tmux. These are copied to `~/Documents/notes/` during install (existing files are not overwritten).

## Re-running

The install script is safe to re-run:
- Existing config files are backed up to `*.bak` before symlinking
- Notes are copied with `cp -n` (no-clobber) so local edits are preserved
- Already-installed tools and plugins are skipped
