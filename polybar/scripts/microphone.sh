#!/usr/bin/env bash

get_status_icon() {
`pactl list | sed -n '/^Source/,/^$/p' | grep Mute | grep yes > /dev/null`

if [ $? -eq 0 ]; then
    echo "%{F#ffffff}"
else
    echo "%{F#ff5555}" 
fi
}

get_status_icon
