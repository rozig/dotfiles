# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Disable auto terminal title
DISABLE_AUTO_TITLE="true"

# Prompt formatting: (username@host:current_path $/#)
PROMPT="%B%F{yellow}%n%f%b%B@%b%B%F{green}%m%f%b%B:%b%B%F{cyan}%~%f%b %(!.%B#%b.%B$%b) "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable kubectl zsh auto-completion
source <(kubectl completion zsh)
