# Dotfiles

Personal dev environment. Unified rose-pine theme across all tools.

## Setup Guide

When the user asks to set up this dotfiles on a new machine, follow these steps. Adapt to the current OS and package manager — do NOT blindly run commands.

### 1. Install packages

Required CLI tools: neovim, ripgrep, fd, bat, eza, zoxide, git-delta, fzf, yazi, starship, zellij, zsh-syntax-highlighting

- macOS: `brew install <packages>`
- Arch: `pacman -S --needed <packages>`
- Other Linux: prefer Homebrew for Linux, or install individually

### 2. Symlink configs

For each tool below, symlink from this repo to the expected location. Check if the target already exists before overwriting — if it does, diff and ask the user.

**Note:** The user's shell may be zsh or bash. Check `$SHELL` first. If bash, merge the aliases and environment setup from `zsh/.zshrc` into `~/.bashrc` instead (skip zsh-specific syntax like `source <(fzf --zsh)`).

```
zsh/.zshrc              → ~/.zshrc  (or merge into ~/.bashrc for bash)
starship/starship.toml  → ~/.config/starship.toml
yazi/                   → ~/.config/yazi/  (symlink individual files: theme.toml, yazi.toml; copy flavors/)
zellij/config.kdl       → ~/.config/zellij/config.kdl
git/.gitconfig          → ~/.gitconfig
git/ignore              → ~/.config/git/ignore
tmux/.tmux.conf         → ~/.tmux.conf
```

### 3. bat / delta theme

```
cp bat/themes/rose-pine.tmTheme ~/.config/bat/themes/
bat cache --build
```

This gives delta its `syntax-theme = rose-pine`.

### 4. Neovim (submodule)

```
git submodule update --init --recursive
```

Then symlink or check if `~/.config/nvim` already exists. If the user already has an nvim config, ask before overwriting.

### 5. Shell plugins

If zsh:
- zsh-autosuggestions: clone to `~/.zsh/zsh-autosuggestions` if not present
- zsh-syntax-highlighting: installed via package manager (step 1)

If bash: skip zsh plugins, but ensure fzf keybindings are sourced via `eval "$(fzf --bash)"`.

### 6. iTerm2 (macOS only)

Download and import rose-pine.itermcolors from the rose-pine/iterm GitHub repo. This step requires manual action in iTerm2 preferences.

### 7. Yazi flavor

Run `ya pkg install` to install the rose-pine flavor registered in package.toml.

## Structure

```
zsh/.zshrc              — Zsh (aliases, zoxide, fzf, starship)
starship/starship.toml  — Starship prompt (rose-pine palette)
yazi/                   — Yazi file manager (rose-pine flavor)
zellij/config.kdl       — Zellij multiplexer (rose-pine, locked mode)
git/.gitconfig          — Git (delta pager, rose-pine syntax theme)
git/ignore              — Global gitignore
bat/themes/             — bat/delta syntax theme (rose-pine tmTheme)
tmux/.tmux.conf         — Tmux config
nvim/                   — Neovim (git submodule → FatPigeorz/nvim_config)
```

## Principles

- All tools use rose-pine theme
- Nvim config is a git submodule (FatPigeorz/nvim_config)
- Configs are symlinked from this repo to their expected locations
- Edit files in this repo, NOT in ~/.config directly
- Before overwriting any existing config, diff and confirm with the user

## Adding a New Tool

1. Create a directory: `<tool>/`
2. Add config files
3. Document the symlink target in this file
4. Update README.md
