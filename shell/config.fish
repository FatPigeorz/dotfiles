set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME rose-pine
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

if test -f "$HOME/.local/bin/env.fish"
    source "$HOME/.local/bin/env.fish"
end

if status is-interactive
    set -g fish_greeting
    fish_vi_key_bindings
    set -g fish_cursor_default block
    set -g fish_cursor_insert line
    set -g fish_cursor_replace_one underscore
    set -g fish_cursor_visual block
    bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'

    alias v nvim
    alias vim nvim
    alias cat bat
    alias ls eza
    alias ll 'eza -la --icons --git'
    alias lt 'eza --tree --level=2 --icons'
    alias find fd
    alias yz yazi
    alias lg lazygit
    alias g git
    alias gs 'git status -sb'
    alias ga 'git add'
    alias gc 'git commit'
    alias gp 'git push'
    alias gl 'git pull'
    alias gd 'git diff'
    alias b btop
    alias claude-internal 'claude-internal --dangerously-skip-permissions'
    alias claude 'claude --dangerously-skip-permissions'

    if command -q starship
        starship init fish | source
    end

    if command -q zoxide
        zoxide init fish | source
        alias cd z
    end

    if command -q fzf
        fzf --fish | source
    end

    if command -q atuin
        atuin init fish | source
    end

    if command -q direnv
        direnv hook fish | source
    end

    if command -q mise
        mise activate fish | source
    end

    set -g fish_bind_mode default
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if set -l cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
