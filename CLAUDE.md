# Linux Terminal Configuration

Personal Linux-side development environment. This file is the entry point for an
agent setting up the dotfiles on a Linux machine or inside WSL.

## Scope

Manage only Linux user configuration:

- fish shell configuration
- Linux CLI tools and language toolchains
- Neovim, Yazi, Zellij, Starship, Git, Delta, bat themes
- files under the Linux home directory such as `~/.config/*`, `~/.gitconfig`,
  and `~/.tmux.conf`

Do not manage host-side Windows settings from this repo:

- Windows Terminal profiles, keybindings, fonts, or color schemes
- Warp settings
- Windows proxy clients
- WSL `.wslconfig`

Those are allowed to exist on the machine, but they are not part of this
dotfiles repo.

## How To Use

When setting up this repo on a new Linux environment:

1. Read this file and `docs/terminal-stack.md`.
2. Detect OS, package manager, and current shell.
3. Prefer fish as the interactive shell unless the user explicitly asks
   otherwise.
4. Install the package set for the detected distro.
5. Copy reference configs into the real config paths.
6. Before overwriting existing config, inspect it and make timestamped backups.
7. Preserve machine-specific values such as `user.name`, `user.email`, tokens,
   proxy settings, and secrets.

Important: do not use symlinks. Copy reference files from this repo into the
machine config locations so each machine can have small local differences.

## 1. Language Toolchains

### Rust

- Install via package manager or `rustup`.
- Preferred default: nightly.
- Recommended components: `rust-analyzer`, `rust-src`, `clippy`, `rustfmt`.
- Fish path is handled by `shell/config.fish`.

### Python

- Install `uv`.
- Use `uv` and `uvx` for project environments and Python tools.

### Multi-runtime Management

- Install `mise`.
- Activate it from fish with `mise activate fish | source`.
- Use `.tool-versions` or `mise.toml` per project when needed.

## 2. Shell

Fish is the primary shell.

- Reference config: `shell/config.fish`
- Target path: `~/.config/fish/config.fish`
- Previous zsh behavior has been migrated into `shell/config.fish`.

The fish config initializes:

- Starship prompt
- zoxide directory jumping
- zsh-era `cd -> zoxide` behavior through `alias cd z`
- fzf keybindings
- atuin history
- direnv
- mise
- Yazi `y` wrapper

## 3. Terminal Workspace

### Zellij

- Install via package manager.
- Reference config: `zellij/config.kdl`
- Target path: `~/.config/zellij/config.kdl`
- Default interaction model is locked-mode first.

### Tmux

- Reference config: `tmux/.tmux.conf`
- Target path: `~/.tmux.conf`
- Kept as a lightweight fallback even when Zellij is preferred.

## 4. File, Search, And Preview Tools

Install:

```text
yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick eza bat
```

Targets:

- `yazi/` -> `~/.config/yazi/`
- `theme/rose-pine.tmTheme` -> `~/.config/bat/themes/rose-pine.tmTheme`
- Run `bat cache --build` after copying the bat theme.
- Run `ya pkg install` from `~/.config/yazi` after copying Yazi config.

## 5. Editor

### Neovim

- Install `neovim` and `python-pynvim`.
- Config source: `nvim/` submodule.
- Preferred target: clone/copy to `~/.config/nvim`.
- Initialize plugins once with `nvim --headless '+qa'`.
- Install Mason LSPs declared by the config:
  `lua-language-server`, `pyright`, `rust-analyzer`, `clangd`.

## 6. Version Control

Install:

```text
git git-delta lazygit github-cli
```

Targets:

- `git/.gitconfig` -> `~/.gitconfig`
- `git/ignore` -> `~/.config/git/ignore`

When applying `git/.gitconfig`, preserve any existing `user.name` and
`user.email` unless the user explicitly wants the repo values.

## 7. Package Summary

For Arch Linux:

```bash
sudo pacman -S --needed \
  fish starship zoxide fzf atuin direnv mise uv nodejs npm go rustup \
  zellij tmux yazi ffmpeg 7zip jq poppler fd ripgrep resvg imagemagick \
  eza bat neovim python-pynvim git git-delta lazygit github-cli \
  btop duf dust procs hyperfine tokei sd
```

Optional font packages are machine/host specific. Do not manage Windows fonts
from this repo.

## 8. Theme

Use Rose Pine where configs exist:

- Starship palette in `starship/starship.toml`
- Yazi flavor in `yazi/flavors/`
- bat/delta syntax theme via `theme/rose-pine.tmTheme`

Read `theme/README.md` for palette details.
