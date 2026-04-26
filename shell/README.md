# Shell Configuration

Fish is the default shell for this dotfiles repo.

## Reference Files

```text
shell/config.fish  -> ~/.config/fish/config.fish
```

The repo used to be zsh-centered. Those settings have been migrated into
`shell/config.fish`; new Linux setups should install fish and copy that file.

## Fish Features

The fish config includes:

- PATH entries for `~/.local/bin`, Cargo, and Go
- `EDITOR=nvim`
- Rose Pine bat theme
- fzf defaults based on `fd`
- vi-style command editing with modal cursor shapes
- Starship prompt
- zoxide smart directory jumping
- old zsh-style `cd` muscle memory via `alias cd z`
- fzf keybindings
- atuin history, with selected commands returned to the prompt for editing
- direnv
- mise
- Yazi `y` wrapper for changing cwd on exit

Vi mode starts in normal mode. It uses a block cursor in normal/visual mode, a
line cursor in insert mode, and `jk` as an insert-mode escape chord.

## Common Aliases

```fish
alias v nvim
alias vim nvim
alias cat bat
alias ls eza
alias ll 'eza -la --icons --git'
alias lt 'eza --tree --level=2 --icons'
alias find fd
alias yz yazi
alias cd z
alias lg lazygit
alias g git
alias gs 'git status -sb'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git pull'
alias gd 'git diff'
alias b btop
```

## Tool Integrations

```fish
starship init fish | source
zoxide init fish | source
fzf --fish | source
atuin init fish | source
direnv hook fish | source
mise activate fish | source
```

## Yazi Wrapper

```fish
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if set -l cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
```

## Notes

- Fish has built-in autosuggestions and syntax highlighting.
- Keep machine-specific proxy settings out of this repo.
