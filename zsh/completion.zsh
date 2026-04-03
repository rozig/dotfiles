# Set up fzf key bindings and fuzzy completion
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# Enable kubectl zsh auto-completion
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  compdef _kubectl kubecolor k
fi

# Enable 1Password zsh auto-completion
if command -v op &> /dev/null; then
  source <(op completion zsh)
  compdef _op op
fi

# Enable jj auto-completion
if command -v jj &> /dev/null; then
  source <(jj util completion zsh)
fi
