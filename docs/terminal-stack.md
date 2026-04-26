# Terminal Stack

This repo documents and manages the Linux side of the terminal stack.

## Boundary

Managed here:

- Linux shell and CLI tool config
- `~/.config/fish/config.fish`
- `~/.config/starship.toml`
- `~/.config/yazi/`
- `~/.config/zellij/config.kdl`
- `~/.config/nvim`
- `~/.gitconfig`
- `~/.config/git/ignore`
- `~/.tmux.conf`

Not managed here:

- Windows Terminal settings
- Windows fonts
- Warp settings
- WSL `.wslconfig`
- Windows proxy applications

Those host-side pieces can be documented elsewhere, but the dotfiles repo stays
Linux-focused.

## Current Shape

The current preferred environment is:

```text
Arch Linux on WSL or native Linux
fish as the login shell
Starship prompt
Zellij for workspace sessions
Neovim for editing
Yazi for file browsing
lazygit for Git workflows
Rose Pine theme across supported tools
```

Windows Terminal can launch the WSL distro, but its profile JSON and font setup
live outside this repo.

## Shell

Fish is the default shell. The reference file is:

```text
shell/config.fish
```

Install it to:

```text
~/.config/fish/config.fish
```

The config wires up:

- vi-style command editing with modal cursor shapes
- `starship init fish`
- `zoxide init fish`
- `fzf --fish`
- `atuin init fish`
- `direnv hook fish`
- `mise activate fish`
- a `y` wrapper for Yazi cwd handoff
- zsh-era `cd -> zoxide` behavior through `alias cd z`

Fish starts in vi mode for command-line editing:

```fish
fish_vi_key_bindings
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block
bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'
```

The old zsh settings have been migrated to fish. New setup should not install
or manage zsh config from this repo.

## Core Tools

Install this set first:

```text
fish starship zoxide fzf atuin direnv eza bat fd ripgrep yazi zellij neovim git git-delta lazygit
```

Then add toolchains:

```text
rustup uv mise nodejs npm go python-pynvim
```

Then add quality-of-life utilities:

```text
btop duf dust procs hyperfine tokei sd jq poppler ffmpeg 7zip resvg imagemagick github-cli tmux
```

## Arch Install Command

```bash
sudo pacman -S --needed \
  fish starship zoxide fzf atuin direnv mise uv nodejs npm go rustup \
  zellij tmux yazi ffmpeg 7zip jq poppler fd ripgrep resvg imagemagick \
  eza bat neovim python-pynvim git git-delta lazygit github-cli \
  btop duf dust procs hyperfine tokei sd
```

## Apply Configs

Copy files instead of symlinking:

```bash
mkdir -p ~/.config/fish ~/.config/bat/themes ~/.config/git

cp ~/.dotfiles/shell/config.fish ~/.config/fish/config.fish
cp ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
cp -a ~/.dotfiles/yazi ~/.config/yazi
cp ~/.dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
cp ~/.dotfiles/theme/rose-pine.tmTheme ~/.config/bat/themes/rose-pine.tmTheme
cp ~/.dotfiles/git/ignore ~/.config/git/ignore
cp ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

bat cache --build
```

For Neovim, prefer a real clone/copy at `~/.config/nvim` instead of a symlink.

## WSL Proxy Note

If this Linux environment runs under WSL and Windows owns the proxy, keep proxy
mechanics outside this repo. The shell config should not hard-code a local proxy.

On a configured WSL machine, the proxy may appear through environment variables:

```bash
env | grep -i proxy
```

For commands that drop environment variables through `sudo`, pass proxy values
explicitly only when needed:

```bash
sudo env http_proxy=$http_proxy https_proxy=$https_proxy pacman -Syu
```
