#!/bin/sh
int=eDP-1
ext1=DVI-I-1-1
ext2=DVI-I-2-2
ext3=HDMI-2

case "$i" in
	"--undocked") xrandr --output "$int" --auto --output "$ext1" --off --output "$ext2" --off --output "$ext3" --off ;;
	"--homedock") xrandr --output "$int" --off --output "$ext1" --auto --output "$ext2" --auto --output "$ext3" --off ;;
	"--workdock") xrandr --output "$int" --auto --output "$ext1" --off --output "$ext2" --off --output "$ext3" --auto ;;
	*) exit 1 ;;
esac

#if xrandr | grep "$ext1 connected"; then
#    xrandr --output "$ext1 " --off --output "$int" --auto
#else
#    xrandr --output "$int" --off --output "$ext1 " --auto
#fi

