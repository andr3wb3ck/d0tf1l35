#!/bin/bash
# Simple script to warn if the battery is low/full/or critical
# Slightly modificated to avoid running multiple instances

file_lock="$HOME/.config/i3/scripts/.tmp/battery_checker.active"

main_cycle () {
  while true
      do
          export DISPLAY=:0.0
          battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
          ac_state=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)



          if [ $ac_state == "on" ]; # check if AC is plugged in
          then
              echo 
              # if [ $battery_level -le 100 ]; then              
              #     notify-send -u critical "Battery charged" "Battery level: ${battery_level}% " -i battery-full-charged
              # fi

          else
              if [ $battery_level -le 10 ]; 
              then              
                  notify-send -u critical "Plug your AC adapter" "Battery level: ${battery_level}% " -i battery-low
              fi

              if [ $battery_level -le 4 ]; 
              then              
                  notify-send -u critical "Critical battery level" "Battery level: ${battery_level}% " -i battery-low
              fi
          fi
          
        sleep 100
      done
}


if [[ -f $file_lock ]]; # check if script was already running
then
    pid=$(cat $file_lock)
    saved_pid=$(ps -p $pid -o comm=)

    me=`basename "$0"`
    script_name="${me%.*}"

    if [ $saved_pid == $script_name ];
    then
        echo killed process $(cat $file_lock) $saved_pid
        kill $(cat $file_lock) # if yeah -- stop it
        sleep 1
    else
        echo not killed process $saved_pid != $script_name
        rm -f $file_lock
    fi
fi

echo $$ > $file_lock 
main_cycle
