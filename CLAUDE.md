# Dotfiles

Personal dev environment managed with symlinks. Unified rose-pine theme.

## Structure
```
zsh/.zshrc              — Zsh config (aliases, zoxide, fzf, starship)
starship/starship.toml  — Starship prompt (rose-pine palette)
yazi/                   — Yazi file manager (rose-pine flavor, config)
zellij/config.kdl       — Zellij multiplexer (rose-pine, locked mode)
git/.gitconfig          — Git (delta pager, side-by-side diff, rose-pine syntax theme)
git/ignore              — Global gitignore
bat/themes/             — bat/delta syntax theme (rose-pine tmTheme)
tmux/.tmux.conf         — Tmux config
nvim/                   — Neovim config (git submodule → FatPigeorz/nvim_config)
install.sh              — One-shot setup script (macOS + Linux)
```

## Principles
- All tools use rose-pine theme
- install.sh supports macOS (brew) and Linux (pacman, brew)
- Nvim config is a git submodule (FatPigeorz/nvim_config)
- Configs are symlinked from ~/.dotfiles to their expected locations

## Editing Configs
- Edit files in this repo, NOT in ~/.config directly (symlinks point here)
- After changes, commit and push — no need to re-run install.sh
- Test changes with `source ~/.zshrc` or restart the relevant tool

## Adding a New Tool
1. Create a directory: `<tool>/`
2. Add config files
3. Add symlink command to `install.sh`
4. Update README.md
