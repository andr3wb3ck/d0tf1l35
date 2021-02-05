#!/bin/bash
# Simple script to display wifi network name
# for multiple interfaces

declare pipe=""

shopt -s lastpipe
nmcli | awk '/: connect/ {print $1, $NF}' | while read -r connection ;
do
    pipe+=". ${connection} "
done
shopt -u lastpipe

echo $pipe