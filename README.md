# Dotfiles

Personal dev environment config. Rose-pine unified theme.

## Quick Setup

```bash
git clone git@github.com:FatPigeorz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

## What's Included

| Tool | Config |
|------|--------|
| Neovim 0.12 | [Submodule](https://github.com/FatPigeorz/nvim_config) (native LSP + vim.pack) |
| Zsh | Aliases, zoxide, fzf, starship |
| Starship | Rose-pine palette |
| Yazi | Rose-pine flavor, nvim as editor |
| Zellij | Rose-pine theme, locked default mode |
| Git + Delta | Rose-pine syntax theme, side-by-side diff |
| bat | Rose-pine tmTheme (shared with delta) |
| tmux | Basic config |

## Brew Packages

neovim, ripgrep, fd, bat, eza, zoxide, git-delta, fzf, yazi, starship, zellij

## Aliases

| Alias | Command |
|-------|---------|
| `vim` | `nvim` |
| `cat` | `bat` |
| `ls` | `eza` |
| `ll` | `eza -la` |
| `lt` | `eza --tree --level=2` |
| `find` | `fd` |
| `yz` | `yazi` |
| `cd` | `z` (zoxide) |
