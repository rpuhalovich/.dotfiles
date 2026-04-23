# alias
alias ls="ls -lah"
alias v="vim"

# git
alias c="git add . && git commit && sleep 3 && git push"
alias ga="git add"
alias gb="git branch -a --color=always | less -R"
alias gblame="git blame"
alias gc="git commit"
alias gch="git checkout"
alias gclone="git clone --recurse-submodules"
alias gdn="git diff --name-status"
alias gf="git fetch --prune --all"
alias gl="git log --date=local"
alias gpull="git fetch --prune --all && git pull --no-rebase --recurse-submodules"
alias gpush="git push"
alias gs="git status --short --branch --show-stash --untracked-files=all"

# global init
bindkey -v '^?' backward-delete-char
touch ~/.hushlogin

# path exports
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts-local

# command line customization
setopt PROMPT_SUBST

NEWLINE=$'\n'
export PROMPT='%d${NEWLINE}> '

# history
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

# edit command in vi
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
