# Sets macOS default configurations in a way I like
#
# Most of the configurations were taken from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#   https://github.com/holman/dotfiles/blob/master/macos
#
# This script will automatically run as part of bootstrap.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: show hidden files/directories (including "." files) in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
