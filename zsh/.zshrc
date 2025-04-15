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

# Plugins
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# tmux support
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
