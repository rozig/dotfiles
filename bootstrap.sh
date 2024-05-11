#!/usr/bin/env bash
ROOT="$(pwd -P)"
DOTFILES_ROOT="$ROOT/.."
CONFIGS_TO_SETUP=("nvim" "tmux" "zsh")

set -e

install_homebrew () {
  if [ ! "$(command -v brew)" &> /dev/null ]; then
    echo "Installing homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "homebrew already exists"
  fi

  # Update brew recipes
  brew update

  # Install dependencies from Brewfile
  brew bundle
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
      echo "$dir already configured, do you want to override? [y]es, [n]o: "
      read -n 1 override

      if [ "$override" == "y" ]; then
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
    # /bin/bash scripts/set_mac_defaults.sh

    # symlink root level dotfiles
    for file in $(find -H "global" -type f); do
      base_file_name="$(basename "$file")"
      src="$ROOT/$file"
      dst="$DOTFILES_ROOT/$base_file_name"

      echo "Linking $base_file_name in home directory ..."

      if [ -f "$dst" ]; then
        echo "$base_file_name already exists in home directory, do you want to override? [y]es, [n]o: "
        read -n 1 override

        if [ $override == "y" ]; then
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

    # Install homebrew
    # install_homebrew
  else
    echo "OS not supported"
  fi

  # Setup dotfiles
  setup_dotfiles
}

main
