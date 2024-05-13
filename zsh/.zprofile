# Set brew env variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable pyenv shims and shell auto-completion
eval "$(pyenv init -)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
