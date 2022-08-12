# Vi keybindings
bindkey -v '^?' backward-delete-char

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{249}'
COLOR_GIT='%F{196}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
# export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '
export PROMPT='${COLOR_DEF}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}> '

alias c="git add . && git commit && sleep 3 && git push"
alias ls="exa -lha"
alias tree="exa --tree"
alias cat="bat"
alias node14="nvm install 14.18.1 && nvm use 14.18.1"
alias node16="nvm install 16.16.0 && nvm use 16.16.0"
alias nodelatest="nvm install latest && nvm use latest"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

