# Set brew env variables
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Enable pyenv shims and shell auto-completion
if [ command -v pyenv &> /dev/null ]; then
  eval "$(pyenv init -)"
fi

# Set up fzf key bindings and fuzzy completion
if [ command -v fzf &> /dev/null ]; then
  eval "$(fzf --zsh)"
fi
