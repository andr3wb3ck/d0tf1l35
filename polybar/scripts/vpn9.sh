#!/usr/bin/env bash
bool=$(pgrep -x openvpn)
if [[$? != 0]]; then
        echo "VPN on"
else
        echo "VPN off"

fi
