# Restore the most recently set wallpaper
nitrogen --restore &

xrdb -merge ~/.Xresources
sxhkd &
exec bspwm
