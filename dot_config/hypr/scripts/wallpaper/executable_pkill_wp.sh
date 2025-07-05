#!/bin/bash

process_id=`/bin/ps -fu $USER| grep "wp_change" | grep -v "grep" | awk '{print $2}'`
kill $process_id

bash $HOME/.config/hypr/scripts/wallpaper/wp_change.sh
