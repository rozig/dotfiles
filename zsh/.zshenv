# Default editor
export EDITOR="$(which nvim)"

# Terminal colors
export CLICOLOR=1
export LSCOLORS="ExFxBxDxCxegedabagacad"

# Default pager
export PAGER="less"

# GnuPG
export GPG_TTY=$(tty)

# Less
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$'\e[1;31m' # Start blinking
export LESS_TERMCAP_md=$'\e[1;34m' # Start bold mode
export LESS_TERMCAP_me=$'\e[0m' # End all mode
export LESS_TERMCAP_so=$'\e[38;5;215m' # Start standout mode
export LESS_TERMCAP_se=$'\e[0m' # End standout mode
export LESS_TERMCAP_us=$'\e[4;35m' # Start underline
export LESS_TERMCAP_ue=$'\e[0m' # End underline

# OpenSSL
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# System paths
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Setup custom config directories
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# Golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
source "$HOME/.cargo/env"
