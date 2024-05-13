autoload -Uz compinit
compinit

# Disable auto terminal title
DISABLE_AUTO_TITLE="true"

# Prompt formatting: (username@host:current_path $/#)
PROMPT="%B%F{yellow}%n%f%b%B@%b%B%F{green}%m%f%b%B:%b%B%F{cyan}%~%f%b %(!.%B#%b.%B$%b) "

export HISTORY_IGNORE="([bf]g|c|clear|e|exit|h|history|incognito|l|l[adfls]|pwd|z)"

# Load other zsh configs
for config in $(find -H "${XDG_CONFIG_HOME:-$HOME/.config}/zsh" -type f -name "*.zsh"); do
  source $config
done

# Enable kubectl zsh auto-completion
source <(kubectl completion zsh)
