autoload -Uz compinit
compinit

# Disable auto terminal title
DISABLE_AUTO_TITLE="true"

# History configuration
HISTORY_IGNORE="([bf]g|c|clear|e|exit|h|history|incognito|l|l[adfls]|pwd|z)"
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Load other zsh configs
for config in $(find -H "${XDG_CONFIG_HOME:-$HOME/.config}/zsh" -type f -name "*.zsh"); do
  source $config
done

# Enable kubectl zsh auto-completion
source <(kubectl completion zsh)
