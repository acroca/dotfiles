#!/bin/bash
internal=eDP-1-1
external=DP-1-3


if xrandr | grep "$external disconnected"; then
  xrandr --output "$external" --off --output "$internal" --auto
elif cat /proc/acpi/button/lid/LID0/state | grep "closed"; then
  xrandr --output "$internal" --off --output "$external" --auto
else
  xrandr \
    --output $external --auto --scale 2x2 --primary --right-of $internal \
    --output $internal --auto --pos 0x0
fi
