# Theme: Rosé Pine

All tools use the [Rosé Pine](https://rosepinetheme.com/) color scheme (variant: `main`).

## Palette

```
base      #191724
surface   #1f1d2e
overlay   #26233a
muted     #6e6a86
subtle    #908caa
text      #e0def4
love      #eb6f92
gold      #f6c177
rose      #ebbcba
pine      #31748f
foam      #9ccfd8
iris      #c4a7e7
```

## Per-tool Configuration

### Neovim
- Plugin: `rose-pine/neovim`
- Set `vim.cmd.colorscheme('rose-pine')` with variant `main`
- Reference: `nvim/lua/plugins/colorscheme.lua`

### Starship
- Use `palette = "rose_pine"` and define `[palettes.rose_pine]` with the colors above
- Reference: `starship/starship.toml`

### Zellij
- Set `theme "rose-pine"` in config.kdl (zellij has built-in rose-pine)
- Reference: `zellij/config.kdl`

### Yazi
- Install flavor: `ya pkg add Mintass/rose-pine`
- Set in theme.toml:
  ```toml
  [flavor]
  dark = "rose-pine"
  light = "rose-pine"
  ```
- Reference: `yazi/theme.toml`, `yazi/flavors/rose-pine.yazi/`

### bat / delta (git diff)
- Copy `theme/rose-pine.tmTheme` to `~/.config/bat/themes/` then run `bat cache --build`
- Set `syntax-theme = rose-pine` in `.gitconfig` under `[delta]`
- Reference: `git/.gitconfig`

### iTerm2 (macOS)
- Download from `rose-pine/iterm` GitHub repo
- Import `.itermcolors` file in Preferences → Profiles → Colors → Color Presets
- This is manual — cannot be automated by symlink

### Other terminals
- For terminals besides iTerm2, find the rose-pine port at https://rosepinetheme.com/
- The key colors to set: background `#191724`, foreground `#e0def4`, cursor `#524f67`

## Adding theme to a new tool

1. Check https://rosepinetheme.com/ for an official port
2. If available, install and configure per that tool's docs
3. If not, use the palette above to create a custom config
4. Document the setup steps in this file
