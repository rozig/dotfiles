# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Disable auto terminal title
DISABLE_AUTO_TITLE="true"

# Prompt formatting: (username@host:current_path $/#)
PROMPT="%B%F{yellow}%n%f%b%B@%b%B%F{green}%m%f%b%B:%b%B%F{cyan}%~%f%b %(!.%B#%b.%B$%b) "
