# aliases
alias btop="sudo btop"
alias c="git add . && git commit && sleep 3 && git push"
alias cat="bat"
alias ls="exa -F1a --icons --group-directories-first"
alias node14="nvm install 14.20.0 && nvm use 14.20.0"
alias node16="nvm install 16.16.0 && nvm use 16.16.0"
alias node17="nvm install 17.3.0 && nvm use 17.3.0"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rmds="find . -name .DS_Store -delete"
alias tree="exa --tree"
alias vim="nvim"

# cheatsheets
alias cstmux="nvim ~/.dotfiles/.cheatsheets/tmux.md"
alias csgit="nvim ~/.dotfiles/.cheatsheets/git.md"

# global init stuff
autoload -Uz compinit
compinit
bindkey -v '^?' backward-delete-char
bindkey '^Y' autosuggest-accept
history -p
touch ~/.hushlogin

# personal scripts
export PATH=$PATH:~/.scripts
export PATH=$PATH:~/.scripts-local

# fzf finding hidden files
export FZF_DEFAULT_COMMAND="find . -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 16.16.0 --silent
export NVM_DIR=~/.nvm

# command line customization
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

export PATH=$PATH:~/.scripts
export PATH=$PATH:~/.scripts-local

export AWS_REGION=ap-southeast-2
