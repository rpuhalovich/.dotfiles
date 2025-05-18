export VISUAL=vim
export EDITOR="$VISUAL"

set -o vi
bind -x '"\C-l": clear'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\e[0;37m\W \[\e[91m\]\$(parse_git_branch)\e[0;37m> \e[0m"

alias c="git add . && git commit && sleep 3 && git push"
alias ls="ls -lah --color"
