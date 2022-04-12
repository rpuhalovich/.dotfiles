#!/bin/sh

int=eDP-1 # Internal screen
ext1=DVI-I-2-2 # Main 16:9 screen
ext2=DVI-I-1-1 # Secondary 16:10 screen
ext3=HDMI-2 # HDMI output

case "$1" in
	"--undocked") xrandr --output "$int" --primary --auto --output "$ext1" --off --output "$ext2" --off --output "$ext3" --off ;;
	"--homedock") xrandr --output "$int" --off --output "$ext1" --primary --auto --output "$ext2" --left-of "$ext1" --auto --output "$ext3" --off ;;
	"--workdock") xrandr --output "$int" --left-of "$ext3" --auto --output "$ext1" --off --output "$ext2" --off --output "$ext3" --primary --auto ;;
	*) exit 1 ;;
esac

