#!/bin/bash

xrandr_commands=()

disconnected_screens=$(xrandr --query | grep " disconnected" | awk '{ print $1 }')
for screen in $disconnected_screens; do
  xrandr_commands+=("--output $screen --off")
done

laptop_screen=""
external_screen=$(xrandr --query | grep " connected" | awk '{ print $1 }' | grep -v eDP)

lid_status=$(cat /proc/acpi/button/lid/*/state | awk '{print $2}')
if [[ $lid_status == "open" ]]; then
  laptop_screen=$(xrandr --query | grep " connected" | awk '{ print $1 }' | grep eDP)
else
  # lid is closed. Set it to off
  lid_closed_screen=$(xrandr --query | grep " connected" | awk '{ print $1 }' | grep eDP)
  xrandr_commands+=("--output $lid_closed_screen --off")
fi

if [[ $laptop_screen ]] && [[ $external_screen ]]; then
  xrandr_commands+=("--output $external_screen --mode 3440x1440 -r 59.97 --primary")
  xrandr_commands+=("--output $laptop_screen --mode 3456x2160 -r 60 --scale 0.5x0.5 --left-of $external_screen")
elif [[ -z $laptop_screen ]] && [[ $external_screen ]]; then
  xrandr_commands+=("--output $external_screen --mode 3440x1440 -r 59.97 --primary")
elif [[ $laptop_screen ]] && [[ -z $external_screen ]]; then
  xrandr_commands+=("--output $laptop_screen --mode 3456x2160 -r 60 --scale 0.5x0.5 --primary")
fi


$(eval xrandr "${xrandr_commands[@]}")
