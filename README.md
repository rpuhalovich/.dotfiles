# .dotfiles

For setting up new systems (currently only need it for my mac).

Copy the following into `crontab -e`.

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday; 7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

0 18 * * * brew upgrade

Install from the Brewfile using the following

```bash
brew bundle --file=~/.dotfiles/Brewfile
```
