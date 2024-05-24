autoload -Uz vcs_info

precmd() {
    vcs_info
}

# VCS configuration
setopt PROMPT_SUBST
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' actionformats \
    '%B%F{magenta}%s:[  %f%F{green}%b%f|%F{yellow}%a%f %u%c%m%F{magenta}]%f '
zstyle ':vcs_info:git:*' formats       \
    '%B%F{magenta}%s:[  %f%F{green}%b%f %u%c%m%F{magenta}]%f '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# More examples: https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='!'
  fi
}

# Prompt formatting: (username@host:current_path ?[git_branch] $/#)
PS1='%B%F{yellow}%n%f'       # user
PS1+='@%F{green}%m%f'        # host
PS1+=':%F{cyan}%~%f'         # cwd
PS1+=' ${vcs_info_msg_0_}'   # VCS
PS1+='%(!.#.$)%b '           # indicator
