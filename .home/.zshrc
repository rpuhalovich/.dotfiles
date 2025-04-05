# zmodload zsh/zprof

source ~/.gitrc

alias ls="ls -lah"
alias rmds="find . -name .DS_Store -delete"
alias v="vim"
alias nv="nvim"
alias uuid="bun -e \"console.log(require('crypto').randomUUID())\""
alias py="python3"

# global init stuff
bindkey -v '^?' backward-delete-char
touch ~/.hushlogin

# path exports
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts-local
export PATH=$PATH:$HOME/go/bin

# dotnet stuff
export DOTNET_CLI_TELEMETRY_OPTOUT=1

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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

function dateString() {
    bun -e 'console.log((new Date("$1")).toString())'
}

# zprof
