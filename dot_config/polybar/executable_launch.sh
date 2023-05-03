#!/usr/bin/env bash

killall -q -9 polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

source ~/private.sh
polybar -c ~/.config/polybar/config main  2> ~/.config/polybar/log.txt &
