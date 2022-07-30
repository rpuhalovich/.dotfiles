bindkey -v '^?' backward-delete-char

alias c="git add . && git commit && sleep 3 && git push"
alias ls="exa -lha"
alias tree="exa --tree"
alias cat="bat"
alias node14="nvm install 14.18.1 && nvm use 14.18.1"
alias nodelatest="nvm install latest && nvm use latest"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

