#!/bin/bash
intern=eDP-1-1
extern=DP-1-3


if xrandr | grep "$extern disconnected"; then
  xrandr --output "$extern" --off --output "$intern" --auto
elif cat /proc/acpi/button/lid/LID0/state | grep "closed"; then
  xrandr --output "$intern" --off --output "$extern" --auto
else
  xrandr \
    --output  DP-1-3 --auto --scale 2x2 --primary --right-of eDP-1-1 \
    --output eDP-1-1 --auto --pos 0x0
fi
