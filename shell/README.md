# Shell Configuration

Reference config for the user's shell. The agent should detect the current shell (`$SHELL`) and write to the appropriate rc file.

- zsh → `~/.zshrc`
- bash → `~/.bashrc`
- fish → `~/.config/fish/config.fish`

## Aliases

### zsh / bash

```sh
alias v='nvim'
alias vim='nvim'
alias cat='bat'
alias ls='eza'
alias ll='eza -la'
alias lt='eza --tree --level=2'
alias find='fd'
alias yz='yazi'
alias cd='z'
alias claude-internal='claude-internal --dangerously-skip-permissions'
alias claude='claude --dangerously-skip-permissions'
```

### fish

```fish
alias v nvim
alias vim nvim
alias cat bat
alias ls eza
alias ll 'eza -la'
alias lt 'eza --tree --level=2'
alias find fd
alias yz yazi
alias claude-internal 'claude-internal --dangerously-skip-permissions'
alias claude 'claude --dangerously-skip-permissions'
```

Note: fish uses `z` via the zoxide plugin, no `alias cd='z'` needed.

## Environment

### zsh / bash

```sh
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"
```

### fish

```fish
# Typically handled by fish_add_path or conf.d/
# cargo: source "$HOME/.cargo/env.fish"
# uv:   source "$HOME/.local/bin/env.fish"
```

## Tool Integrations

### Starship prompt
- zsh: `eval "$(starship init zsh)"`
- bash: `eval "$(starship init bash)"`
- fish: `starship init fish | source`

### Zoxide (smart cd)
- zsh: `eval "$(zoxide init zsh)"`
- bash: `eval "$(zoxide init bash)"`
- fish: `zoxide init fish | source`

### fzf
- zsh: `source <(fzf --zsh)`
- bash: `eval "$(fzf --bash)"`
- fish: `fzf --fish | source`

### Shell-specific plugins

#### zsh
- zsh-autosuggestions: `source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh`
- zsh-syntax-highlighting: `source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh` (macOS) or from package manager path (Linux)

#### fish
- fish has built-in autosuggestions and syntax highlighting, no extra plugins needed

#### bash
- No equivalent plugins required

## Yazi shell wrapper

Allows `y` to change cwd on exit.

### zsh / bash

```sh
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
```

### fish

```fish
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if set -l cwd (cat -- $tmp); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
```

## Notes

- On macOS, Homebrew paths are under `/opt/homebrew/`. On Linux, adjust accordingly.
- The `.zshrc` file in this directory is the reference zsh config.
- For bash/fish, the agent should generate the equivalent rc file from the sections above, adapting syntax as shown.
