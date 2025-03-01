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

# kubectl aliases
alias k="kubectl"
alias decode_secret="kubectl get secret -o go-template='{{range \$k,\$v := .data}}{{printf \"%s: \" \$k}}{{if not \$v}}{{\$v}}{{else}}{{\$v | base64decode}}{{end}}{{\"\\n\"}}{{end}}'"

function lk {
  cd "$(walk "$@" --icons)"
}

function gen-ssh-key {
  ssh-keygen -t ed25519 $@
}
