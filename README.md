# .dotfiles

For setting up new systems.

## systemctl

enable the following:
- ly
- cronie

## Cronie Settings

`crontab -e` to get into crontab for the current user.
`0 18 1,15 * * sh sh ~/.dotfiles/scripts/cron.sh`

