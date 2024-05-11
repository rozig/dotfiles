# Load custom dotfiles
for file in $HOME/.{aliases,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
