#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n Logout\n Lock" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/power.rasi"')

case "$chosen" in
	"  Power Off") sudo shutdown now ;;
	"  Restart") sudo reboot ;;
	"  Logout") i3-msg exit ;;
  "  Lock") slock ;;
	*) exit 1 ;;
esac
