# .dotfiles

For setting up new systems.

## systemctl

enable the following:
- ly
- cronie
- bluetooth
- suspend\@rp.service

That last one should be populated with the suspend and lock script.

## Cronie Settings

`crontab -e` to get into crontab for the current user.
30 17 * * * /home/rp/.dotfiles/.local/bin/update && XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send Cronie "System has been updated."

## Finding keybindings
`xev -event keyboard`

## TODO

- [ ] Add systemctl and login files to handle lid close and suspend and lock.

