# aliases
alias c="git add . && git commit && sleep 3 && git push"
alias cat="bat"
alias du="duf"
alias ls="exa -F1a --icons --group-directories-first"
alias node16="nvm install 16.16.0 && nvm use 16.16.0"
alias node18="nvm install 18.16.0 && nvm use 18.16.0"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rmds="find . -name .DS_Store -delete"
alias tree="exa --tree"
alias v="nvim"
alias vim="nvim"

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
history -p
touch ~/.hushlogin

# personal scripts
export PATH=$PATH:~/.scripts
export PATH=$PATH:~/.scripts-local

# nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 18.16.0 --silent
export NVM_DIR=~/.nvm

# bat
export BAT_THEME="gruvbox-dark"

# exa
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
