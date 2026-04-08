# AI-Friendly Terminal Configuration

Personal dev environment. Unified rose-pine theme. This file is the entry point for Claude Code to set up a new machine.

## How to use

When the user asks to set up this dotfiles on a new machine:

1. Read this file to understand what to install
2. Detect the current OS (`uname -s`), package manager, and shell (`$SHELL`)
3. Ask the user which categories they need (or install all)
4. For each tool, read the reference config in this repo, then read the machine's current config (if any), diff them, and write the appropriate config to the machine
5. Before overwriting any existing config, diff and confirm with the user

**Important:** Do NOT use symlinks. Read the reference configs in this repo and write them to the correct locations on the machine. This allows per-machine customization without breaking the repo.

---

## 1. Language Toolchains

### Rust
- Install: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- After install: `rustup default nightly`
- Provides: `cargo`, `rustc`, `rustup`
- Environment: `source "$HOME/.cargo/env"` (added by shell config)

### Python (uv)
- Install: `curl -LsSf https://astral.sh/uv/install.sh | sh`
- Provides: `uv`, `uvx` (fast pip/venv replacement)
- Environment: `source "$HOME/.local/bin/env"` (added by shell config)

---

## 2. Terminal Environment

### Shell (zsh / bash / fish)
- Read `shell/README.md` for aliases, environment, tool integrations
- Detect `$SHELL` and write to the appropriate rc file
- Reference config: `shell/.zshrc`

### Multiplexer — Zellij
- Install: via package manager
- Reference: `zellij/config.kdl` → write to `~/.config/zellij/config.kdl`
- Default mode: locked
- Theme: rose-pine (built-in, see `theme/README.md`)

### Prompt — Starship
- Install: via package manager
- Reference: `starship/starship.toml` → write to `~/.config/starship.toml`
- Theme: rose-pine palette defined in config

---

## 3. File & Search

### File manager — Yazi
- Install: via package manager
- Reference: `yazi/theme.toml`, `yazi/yazi.toml` → write to `~/.config/yazi/`
- Flavor: copy `yazi/flavors/` → `~/.config/yazi/flavors/`, then `ya pkg install`
- Theme: rose-pine flavor (see `theme/README.md`)
- Optional extensions (install for full functionality):
  - nerd-fonts (icons, recommended)
  - ffmpeg (video thumbnails)
  - 7-Zip (archive extraction/preview, non-standalone version)
  - jq (JSON preview)
  - poppler (PDF preview)
  - fd (file searching)
  - rg / ripgrep (file content searching)
  - fzf (quick subtree navigation, >= 0.53.0)
  - zoxide (historical directory navigation, requires fzf)
  - resvg (SVG preview)
  - ImageMagick (Font/HEIC/JPEG XL preview, >= 7.1.1)
  - Linux only: xclip / wl-clipboard / xsel (clipboard support)
- Platform install commands:
  - macOS: `brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font`
  - Arch: `pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick`
  - Ubuntu/Debian: `apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick`

### Search — ripgrep, fd, fzf
- Install: via package manager (`ripgrep`, `fd`, `fzf`)
- ripgrep: fast `grep` replacement (`rg`)
- fd: fast `find` replacement
- fzf: fuzzy finder, integrated into shell (see `shell/README.md`)
- No config files needed

### Browse — eza, bat, zoxide
- Install: via package manager (`eza`, `bat`, `zoxide`)
- eza: modern `ls` replacement
- bat: `cat` with syntax highlighting, theme via `theme/rose-pine.tmTheme`
- zoxide: smart `cd` replacement
- bat theme setup: `cp theme/rose-pine.tmTheme ~/.config/bat/themes/ && bat cache --build`

---

## 4. Editor

### Neovim
- Install: via package manager (`neovim`)
- Config: git submodule at `nvim/` — clone `FatPigeorz/nvim_config` to `~/.config/nvim`
- Init submodule: `git submodule update --init --recursive`
- If user already has nvim config, ask before overwriting
- Theme: rose-pine (plugin in `nvim/lua/plugins/colorscheme.lua`)

---

## 5. Version Control

### Git + Delta
- Install: via package manager (`git`, `git-delta`)
- Reference: `git/.gitconfig` → write to `~/.gitconfig` (merge with existing if present, preserve user.email/user.name)
- Reference: `git/ignore` → write to `~/.config/git/ignore`
- Delta: side-by-side diff, rose-pine syntax theme (see `theme/README.md`)

---

## 6. Theme — Rosé Pine

Read `theme/README.md` for:
- Full color palette
- Per-tool theming instructions
- How to add rose-pine to a new tool

The `theme/` directory also contains `rose-pine.tmTheme` used by bat and delta.

---

## Package Summary

All packages to install via package manager:

```
neovim ripgrep fd bat eza zoxide git-delta fzf yazi starship zellij
```

Platform-specific:
- macOS: `brew install <packages>` + `zsh-syntax-highlighting`
- Arch: `pacman -S --needed <packages>`
- Ubuntu/Debian: prefer Homebrew for Linux
- zsh plugins: zsh-autosuggestions (git clone), zsh-syntax-highlighting (package manager)

---

## Directory Structure

```
shell/          — Shell config (aliases, env, tool integrations for zsh/bash/fish)
starship/       — Starship prompt config (rose-pine palette)
yazi/           — Yazi file manager config + rose-pine flavor
zellij/         — Zellij multiplexer config
git/            — Git config (.gitconfig + global ignore)
nvim/           — Neovim config (git submodule → FatPigeorz/nvim_config)
tmux/           — Tmux config
theme/          — Rose Pine theme (palette, tmTheme, per-tool guide)
```

## Principles

- All tools use rose-pine theme
- Don't assume anything is pre-installed — install from scratch
- Detect OS, package manager, and shell before configuring
- **No symlinks** — read reference configs from this repo, write to machine's config locations
- This allows per-machine differences without diverging the repo
- Before overwriting any existing config, diff and confirm with the user
- When updating configs, update both the machine AND the reference files in this repo
