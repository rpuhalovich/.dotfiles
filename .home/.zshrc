source ~/.gitrc

alias ls="ls -lah"
alias v="vim"

# global init stuff
bindkey -v '^?' backward-delete-char
touch ~/.hushlogin

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# path exports
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts-local
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/go/bin

# svn stuff
export SVN_EDITOR=vim

# command line customization
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{249}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DEF}%d${COLOR_DEF}${NEWLINE}> '

# history
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

# edit command in vi
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
