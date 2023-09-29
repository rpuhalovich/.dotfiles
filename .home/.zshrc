# aliases
alias cat="bat"
alias du="duf"
alias ls="eza -F1a --icons --group-directories-first"
alias node16="nvm install 16.16.0 && nvm use 16.16.0"
alias node18="nvm install 18.17.1 && nvm use 18.17.1"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rmds="find . -name .DS_Store -delete"
alias tree="eza --tree"
alias v="nvim"

# git
fmt='%C(bold blue)<%cn> %Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Creset'

alias c="git add . && git commit && sleep 3 && git push"
alias ga="git add ."
alias gb="git branch -a"
alias gc="git commit"
alias gch="git checkout"
alias gcl="git clone --recursive"
alias gd="git difftool"
alias gf="git fetch --prune --all"
alias gl="tput smcup && git log && tput rmcup"
alias glg="tput smcup && git log --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'$fmt' && tput rmcup"
alias glo="tput smcup && git log --oneline --pretty=format:'$fmt' && tput rmcup"
alias glt="tput smcup && git log --tags --no-walk --pretty=oneline --abbrev-commit && tput rmcup"
alias gm="git ls-files -m"
alias gs="git status --short --branch --show-stash"

# cheatsheets
alias csgit="nvim ~/.dotfiles/.cheatsheets/git.md"
alias cstmux="nvim ~/.dotfiles/.cheatsheets/tmux.md"
alias csvim="nvim ~/.dotfiles/.cheatsheets/nvim.md"
alias csunreal="nvim ~/.dotfiles/.cheatsheets/unreal.md"

# global init stuff
autoload -Uz compinit
compinit
bindkey -v '^?' backward-delete-char
bindkey '^Y' autosuggest-accept
touch ~/.hushlogin
# history -p

# personal scripts
export PATH=$PATH:~/.scripts
export PATH=$PATH:~/.scripts-local

# nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 18.17.1 --silent
export NVM_DIR=~/.nvm

# bat
export BAT_THEME="gruvbox-dark"

# eza
export LS_COLORS="$(vivid generate gruvbox-dark-soft)"

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

# other
export AWS_REGION=ap-southeast-2
