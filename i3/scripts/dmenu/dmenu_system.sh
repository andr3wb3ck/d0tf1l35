#!/bin/sh
# A simple dmenu script for managin basic system settings


confirmation () {
    if [ $(echo -e "No\nYes" | dmenu -i -b -nb '#222222' -sf '#eeeeee' -sb '#797f6d' -nf '#797f6d' -p "SURE?") != "Yes" ]; then
        exit 1
    fi
}
options="Lock\nSuspend\nLog-out\nShutdown\nManage-monitors\n"
selection=$(echo -e "$options" | dmenu -i -b -nb '#222222' -sf '#eeeeee' -sb '#797f6d' -nf '#797f6d' -p "SYSTEM")

if [ $selection == "Lock" ]; then
    betterlockscreen -l blur
fi

if [ $selection == "Suspend" ]; then
    confirmation
    systemctl suspend
fi

if [ $selection == "Log-out" ]; then
    confirmation
    i3-msg exit
fi

if [ $selection == "Shutdown" ]; then
    confirmation
    shutdown now
fi

if [ $selection == "Manage-monitors" ]; then
        monitor_options="Dual-screen\nInternal\nVGA-only\nARandr\n"
        selection=$(echo -e "$monitor_options" | dmenu -i -b -nb '#222222' -sf '#eeeeee' -sb '#797f6d' -nf '#797f6d' -p "Monitor configuration")

        # Change monitor resolution/name to your own characteristics
        if [ $selection == "Internal" ]; then
            xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --off
        fi

        if [ $selection == "Dual-screen" ]; then
            xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --primary --mode 1680x1050 --pos 1920x0 --rotate normal --output HDMI-2 --off
        fi

        if [ $selection == "VGA-only" ]; then
            xrandr --output eDP-1 --off --output HDMI-1 --off --output DP-1 --primary --mode 1680x1050 --pos 1920x0 --rotate normal --output HDMI-2 --off
        fi

        if [ $selection == "ARandr" ]; then
            arandr
        fi 
fi







