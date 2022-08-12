#!/bin/bash

# Modified from: https://github.com/qmacro/dotfiles

# Run: curl https://raw.githubusercontent.com/rpuhalovich/.dotfiles/main/bas.sh | bash

set -o errexit

# Global variables.
declare dotfiles="$HOME/.dotfiles"

# Bring in and set up dotfiles.
setup_dotfiles() {
  rm -rf "$dotfiles"
  git clone https://github.com/rpuhalovich/.dotfiles.git "$dotfiles"
  ln -s -f "$dotfiles/home/.vimrc" "$HOME/.vimrc"
  ln -s -f "$dotfiles/home/.gitconfig" "$HOME/.gitconfig"
  ln -s -f "$dotfiles/home/.bashrc" "$HOME/.bashrc"
}

# Configure dev space.
modify_theia_settings() {
  ln -s -f "$dotfiles/.theia/settings.json" "$HOME/.theia/"
}

git_open() {
  npm i -g git-open
}

main() {
  setup_dotfiles
  modify_theia_settings
  git_open
}

main "$@"
