#!/bin/sh
# Simple script to add sound to dusnt notification
# as well as to control whether sound is muted 
# or notifications are entirely disabled

src_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
sound_file=$src_dir/notification.ogg
muted=$src_dir/.tmp/.muted_true

# if argument empty -- play sound
#                 1 -- toggle disable notifications
#                 2 -- toggle mute state
#                 3 -- get active state

# Toggle mute
if [[ $1 -eq 1 ]];
then 
    if [[ -f $muted ]];
    then
        rm -f $muted
        paplay $sound_file
    else
        touch $muted
    fi
    exit 1

# Toggle disable
elif [[ $1 -eq 2 ]];
then
    dunstctl set-paused toggle
    exit 1

# Get state
elif [[ $1 -eq 3 ]];
then
    if [ $(dunstctl is-paused) = true ];
    then
        echo 
    else
        if [[ -f $muted ]];
        then
            echo 
        else
            echo 
        fi
    fi

# Play sound.., or not..
else
    if [[ -f $muted ]];
    then
        echo "Muted.. Shh!"
    else
        paplay $sound_file
        #ffplay -nodisp -autoexit -loglevel quiet $sound_file
    fi
fi

