#!/usr/bin/env bash
ROOT="$(pwd -P)"
DOTFILES_ROOT="$ROOT/.."
CONFIGS_TO_SETUP=("git" "nvim" "tmux" "zsh" "ripgrep")

set -e

install_homebrew_and_deps () {
  if [ ! "$(command -v brew)" &> /dev/null ]; then
    echo "Installing homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "homebrew already exists"
  fi

  # Update brew recipes and install deps
  brew update
  brew bundle
  brew cleanup --prune=all
  brew doctor

  # Install tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

config_gnupg () {
  echo "Configuring gnupg"
  home_path="$DOTFILES_ROOT/.config/gnupg"
  if [ ! -d $home_path ]; then
    mkdir $home_path
    chmod 700 $home_path
  fi

  ln -s "$ROOT/gnupg/gpg.conf" "$home_path/gpg.conf"
  ln -s "$ROOT/gnupg/gpg-agent.conf" "$home_path/gpg-agent.conf"
  chmod 600 "$home_path/gpg.conf"
  chmod 600 "$home_path/gpg-agent.conf"

  echo "gnupg configured"
}

change_default_shell_to_zsh () {
  if [ ! "$(command -v zsh)" &> /dev/null ]; then
    chsh -s $(which zsh)
    "Default shell changed to zsh"
  else
    "Default shell is already zsh"
  fi
}

setup_dotfiles () {
  echo "Setting up dotfiles"

  if [ ! -d "$DOTFILES_ROOT/.config" ]; then
    mkdir "$DOTFILES_ROOT/.config"
  fi
  
  for dir in "${CONFIGS_TO_SETUP[@]}"; do
    src="$ROOT/$dir"
    dst="$DOTFILES_ROOT/.config/$dir"
    
    echo "Configuring $dir ..."

    if [ -d "$dst" ]; then
      echo "$dir already configured, do you want to override? [y]es, [b]ackup, [n]o: "
      read -n 1 override

      if [ "$override" == "y" ]; then
        ln -sf "$src" "$dst"
      elif [ "$override" == "b" ]; then
        mv "$dst" "$dst.bk"
        ln -sf "$src" "$dst"
      else
        echo "Skipping $dir"
        continue
      fi
    else
      ln -s "$src" "$dst"
    fi

    echo "Configured $dir"
  done
}

main () {
  if [ "$(uname -s)" == "Darwin" ]; then
    # Set macOS defaults
    /bin/bash scripts/set_macos_defaults.sh

    # symlink root level dotfiles
    for file in $(find -H . -type f -name "*.symlink"); do
      base_file_name="$(basename "$file")"
      src="$ROOT/$file"
      dst="$DOTFILES_ROOT/${base_file_name%.*}"

      echo "Linking $base_file_name in home directory ..."

      if [ -f "$dst" ]; then
        echo "$base_file_name already exists in home directory, do you want to override? [y]es, [b]ack up, [n]o: "
        read -n 1 override

        if [ $override == "y" ]; then
          ln -sf "$src" "$dst"
        elif [ $override == "b" ]; then
          mv "$dst" "$dst.bk"
          ln -sf "$src" "$dst"
        else
          echo "Skipping $base_file_name"
          continue
        fi
      else
        ln -s "$src" "$dst"
      fi

      echo "Linked $file to $dst"
    done

    # Install homebrew and bundle
    install_homebrew_and_deps

  else
    echo "OS not supported"
  fi

  # Change default shell to zsh
  change_default_shell_to_zsh

  # Setup dotfiles
  setup_dotfiles
}

main
