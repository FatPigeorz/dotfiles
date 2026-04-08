eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
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

# zoxide (smart cd)
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
