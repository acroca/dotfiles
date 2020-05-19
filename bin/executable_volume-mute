#!/usr/bin/env bash
SINK=$(pacmd list-sinks | grep "* index" | cut -d " " -f 5)
pactl set-sink-mute $SINK toggle
