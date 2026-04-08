# Shell Configuration

Reference config for the user's shell. The agent should detect the current shell (`$SHELL`) and write to the appropriate rc file (`~/.zshrc` or `~/.bashrc`).

## Aliases

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

## Environment

```sh
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"
```

## Tool Integrations

### Starship prompt
- zsh: `eval "$(starship init zsh)"`
- bash: `eval "$(starship init bash)"`

### Zoxide (smart cd)
- zsh: `eval "$(zoxide init zsh)"`
- bash: `eval "$(zoxide init bash)"`

### fzf
- zsh: `source <(fzf --zsh)`
- bash: `eval "$(fzf --bash)"`

### Zsh-only plugins
- zsh-autosuggestions: `source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh`
- zsh-syntax-highlighting: `source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh` (macOS) or from package manager path (Linux)

## Yazi shell wrapper

Allows `y` to change cwd on exit:

```sh
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
```

## Notes

- On macOS, Homebrew paths are under `/opt/homebrew/`. On Linux, adjust accordingly.
- The `.zshrc` file in this directory is the reference zsh config. For bash, the agent should generate an equivalent `~/.bashrc` from the sections above.
