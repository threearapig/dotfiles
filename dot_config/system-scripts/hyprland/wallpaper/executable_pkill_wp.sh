#!/bin/bash

process_id=`/bin/ps -fu $USER| grep "wp-change" | grep -v "grep" | awk '{print $2}'`
kill $process_id

bash $HOME/.config/system-scripts/hyprland/wallpaper/wp-change.sh
