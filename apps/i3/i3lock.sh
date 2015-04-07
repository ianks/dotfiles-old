#!/usr/bin/env bash

scrot /tmp/screenshot.png
mogrify -blur 0x5 /tmp/screenshot.png
i3lock -i /tmp/screenshot.png
sleep 60; pgrep i3lock && xset dpms force off
