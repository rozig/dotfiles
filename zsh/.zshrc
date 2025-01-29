# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Load other zsh configs
for config in $(find -H "${XDG_CONFIG_HOME:-$HOME/.config}/zsh" -type f -name "*.zsh"); do
  source $config
done

# Enable kubectl zsh auto-completion
if [ command -v kubectl &> /dev/null ]; then
  source <(kubectl completion zsh)
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
source "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/powerlevel10k.zsh-theme"
