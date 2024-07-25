alias ls="eza -lah --group-directories-first"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rmds="find . -name .DS_Store -delete"
alias v="nvim"

# git
function gmod {
    git status --porcelain | grep '^ M' | sed 's/^ M//'
}

function gmerge() {
    if [ $# -ne 1 ]; then
        echo "Invalid arguments"
        return
    fi
    git fetch --prune --all
    git checkout $1
    git pull --no-rebase
    git checkout -
    git merge $1
}

formatting='%C(bold blue)<%cn> %Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Creset'
alias c="git add . && git commit && git push"
alias ga="git add ."
alias gb="git branch -a --color=always"
alias gblame="git blame"
alias gc="git commit"
alias gch="git checkout"
alias gcl="gclone"
alias gclone="git clone --recursive"
alias gd="git difftool"
alias gdn="git diff --name-status"
alias gf="git fetch --prune --all"
alias gl="git log"
alias glg="git log --first-parent --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'$formatting'"
alias glo="git log --oneline --pretty=format:'$formatting'"
alias glt="git log --tags --no-walk --pretty=oneline --abbrev-commit"
alias gpull="git pull --no-rebase && git fetch --prune --all"
alias gpush="git push"
alias gs="git status --short --branch --show-stash --untracked-files=all"

# global init stuff
autoload -Uz compinit
compinit
bindkey -v '^?' backward-delete-char
bindkey '^Y' autosuggest-accept
touch ~/.hushlogin

# path exports
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts-local

# nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 18.18.0 --silent
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

# history
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

# edit command in vi
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
