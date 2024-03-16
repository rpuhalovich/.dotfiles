# aliases
alias du="duf"
alias ls="eza -la --icons --group-directories-first"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rmds="find . -name .DS_Store -delete"
alias tree="eza --tree"
alias v="nvim"

# git
alias c="git add . && git commit && sleep 3 && git push"
alias ga="git add ."
alias gb="tput smcup && git branch -a --color=always | less -R && tput rmcup"
alias gc="git commit"
alias gch="git checkout"
alias gcl="git clone --recursive"
alias gd="git difftool"
alias gpl="git pull --no-rebase"
alias gph="git push"
alias gf="git fetch --prune --all"
# alias gm="git status --porcelain | grep ' M ' | sed 's/ M //'"
alias gs="git status --short --branch --show-stash && echo '## modified' && git status --porcelain | grep ' M ' | sed 's/ M //'"

fmt='%C(bold blue)<%cn> %Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Creset'
alias gl="git log"
alias glg="git log --first-parent --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'$fmt'"
alias glo="git log --oneline --pretty=format:'$fmt'"
alias glt="git log --tags --no-walk --pretty=oneline --abbrev-commit"

# cheatsheets
alias csgit="nvim ~/.dotfiles/.cheatsheets/git.md"
alias cstmux="nvim ~/.dotfiles/.cheatsheets/tmux.md"
alias csvim="nvim ~/.dotfiles/.cheatsheets/nvim.md"
alias csunreal="nvim ~/.dotfiles/.cheatsheets/unreal.md"

# google stuff
alias gm="/Volumes/ryan_ssd/v8/v8/tools/dev/gm.py"

# global init stuff
autoload -Uz compinit
compinit
bindkey -v '^?' backward-delete-char
bindkey '^Y' autosuggest-accept
touch ~/.hushlogin

# path exports
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts-local
export PATH=$PATH:$HOME/dev/depot_tools

# doom emacs
alias d="doom run"
export PATH=$PATH:$HOME/.config/emacs/bin
export TERM=xterm-256color

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
