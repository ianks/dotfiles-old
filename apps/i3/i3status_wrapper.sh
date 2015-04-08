#!/bin/bash

i3status -c ~/.i3/i3status.conf | while :
do
    read line
    brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    volume=$(pulseaudio-ctl full-status | cut -d ' ' -f1)
    echo " ${brightness} |  ${volume} | $line" || exit 1
done
