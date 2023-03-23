alias c="git add . && git commit && sleep 3 && git push"
alias rmds="find . -name .DS_Store -delete"
alias ls="exa -F1a --icons --group-directories-first"
alias tree="exa --tree"
alias cat="bat"
alias btop="sudo btop"
alias vim="nvim"
alias py="python3"
alias python="python3"
alias node14="nvm install 14.20.0 && nvm use 14.20.0"
alias node16="nvm install 16.16.0 && nvm use 16.16.0"

autoload -Uz compinit
compinit

bindkey -v '^?' backward-delete-char
bindkey '^Y' autosuggest-accept

history -p

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{249}'
COLOR_GIT='%F{196}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DEF}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}> '

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

nvm use 16.16.0 --silent

touch ~/.hushlogin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
