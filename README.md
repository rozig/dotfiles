# rozig's dotfiles :polar_bear:
<img width="100%" alt="neofetch" src="https://github.com/rozig/dotfiles/assets/5547495/c200b2bc-4efc-4b1b-9afb-552dad55b22e">
This repository contains all the configurations that I make to comfortably code on macOS.

## Overview

The repo includes automated script intended to be used on a clean installation of macOS. It is a very simple script which creates a symlink for the configuration directories under `$XDG_CONFIG_HOME` and the reason behind this is mainly for sync purpose. Whenever I make a configuration update it will always end up in the repo itself. The script does following:
 1. Sets macOS defaults
 2. Creates symlinks for some of the stuff that need to go to home directory
 3. Installs homebrew and dependencies from Brewfile
 4. Change default shell to zsh
 5. Creates symlinks for the configuration files in `~/.config` directory

## Installation
```sh
# Install Xcode Command Line Tools, skip if you already have it installed
xcode-select --install

git clone https://github.com/rozig/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## Acknowledgements
 - The main structure of the repo and the bootstrap script are inspired by [@holman](https://github.com/holman)'s [dotfiles repo](https://github.com/holman)
 - and all macOS default configurations are taken from [@mathiasbynens](https://github.com/mathiasbynens)'s great list of [Sensible macOS defaults](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
 - nvim config structure is inspired by [@ThePrimeagen](https://github.com/ThePrimeagen)'s [init.lua](https://github.com/ThePrimeagen/init.lua)
 - nvim configurations are mostly inspired by [@tjdevries](https://github.com/tjdevries)'s [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
