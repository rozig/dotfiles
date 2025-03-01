#!/usr/bin/env bash

HOME_DIR="$(eval echo ~$USER)"
CONFIG_DIR="$HOME_DIR/.config"
REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

CONFIGS_TO_SETUP=("alacritty" "fastfetch" "git" "nvim" "powerlevel10k" "ripgrep" "tmux" "zsh")

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

  if [ ! -f "$HOME_DIR/Brewfile" ]; then
    ln -s "$REPO_ROOT/Brewfile.macos" "$HOME_DIR/Brewfile"
    brew bundle
  fi

  brew upgrade
  brew cleanup --prune=all

  if [ -f "$HOME_DIR/Brewfile" ]; then
    rm "$HOME_DIR/Brewfile"
  fi
}

config_gnupg () {
  echo "Configuring gnupg"
  gpg_path="$CONFIG_DIR/gnupg"
  if [ ! -d $gpg_path ]; then
    mkdir $gpg_path
    chmod 700 $gpg_path
  fi

  ln -s "$REPO_ROOT/gnupg/gpg.conf" "$gpg_path/gpg.conf"
  ln -s "$REPO_ROOT/gnupg/gpg-agent.conf" "$gpg_path/gpg-agent.conf"
  chmod 600 "$gpg_path/gpg.conf"
  chmod 600 "$gpg_path/gpg-agent.conf"

  echo "gnupg configured"
}

change_default_shell_to_zsh () {
  if [ ! "$(command -v zsh)" &> /dev/null ]; then
    chsh -s $(which zsh)
    echo "Default shell changed to zsh"
  else
    echo "Default shell is already zsh"
  fi
}

setup_dotfiles () {
  echo "Setting up dotfiles"

  if [ ! -d "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
  fi
  
  for app in "${CONFIGS_TO_SETUP[@]}"; do
    src="$REPO_ROOT/$app"
    dst="$CONFIG_DIR/$app"
    
    echo "Configuring $app ..."

    if [ -d "$dst" ]; then
      echo "$app already configured, do you want to override? [y]es, [b]ackup, [n]o: "
      read -n 1 override

      if [ "$override" == "y" ]; then
        # stow -v -R -t "$CONFIG_DIR" "$app"
        ln -sf "$src" "$dst"
      elif [ "$override" == "b" ]; then
        mv "$dst" "$dst.bk"
        # stow -v -R -t "$CONFIG_DIR" "$app"
        ln -s "$src" "$dst"
      else
        echo "Skipping $app"
        continue
      fi
    else
      # stow -v -R -t "$CONFIG_DIR" "$app"
      ln -s "$src" "$dst"
    fi

    echo "Configured $dir"
  done

  echo "Installing tpm plugins ..."
  "$CONFIG_DIR/tmux/plugins/tpm/bin/install_plugins"
  echo "Installed tpm plugins"
}

create_symlinks () {
  for file in $(find -H . -type f -name "*.symlink"); do
    base_file_name="$(basename "$file")"
    src="$REPO_ROOT/$file"
    dst="$HOME_DIR/${base_file_name%.*}"

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
}

main () {
  last_active_dir="$(pwd -P)"
  cd $REPO_ROOT

  git submodule init
  git submodule update

  if [ "$(uname -s)" == "Darwin" ]; then
    # Set macOS defaults
    "scripts/set_macos_defaults.sh"

    # Install homebrew and bundle
    install_homebrew_and_deps
  # elif [ "$(uname -s)" == "Linux" ]; then
  fi

  # Change default shell to zsh
  change_default_shell_to_zsh

  # Setup dotfiles
  setup_dotfiles

  # Config gnupg
  config_gnupg

  cd $last_active_dir
}

main
