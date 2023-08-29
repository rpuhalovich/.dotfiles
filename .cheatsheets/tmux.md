`tmux source <path to .tmux.conf>`: reload tmux inside terminal
`move-window -t 0`: move window if not already in use
`swap-window -t 0`: swap window
`kill-session -a`: kill all sessions except current
`C-a ?`: show help docs

## to copy and paste from the tmux buffer

1. go to copy mode via `<leader>[`
2. use vim keybindings to navigate to text to select
3. press `<space>` to begin copy mode
4. highlight the text you want to select
5. press `<cr>` to copy the text to your system clipboard
