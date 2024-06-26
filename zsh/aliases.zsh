# Aliases
alias l="ls -l"
alias lr="ls -R"
alias ls="ls -GFh"
alias ll="ls -lha"
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -iv"
alias mkdir="mkdir -v"
alias rm="rm -i"
alias rmf="rm -rf"
alias grep="grep --color=auto"
alias vim="nvim"
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/init.conf"'
alias k="kubectl"

function lk {
  cd "$(walk "$@" --icons)"
}

function gen-ssh-key {
  ssh-keygen -t ed25519 $@
}
