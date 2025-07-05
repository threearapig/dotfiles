#!/bin/bash

# This controls (in seconds) when to switch to the next image
INTERVAL=300

swww init

while true; do
	find "$HOME/.wallpapers/" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img "$img" \
			--transition-bezier .43,1.19,1,.4 \
			--transition-type grow \
			--transition-duration 0.7 \
			--transition-fps 60 \
			--invert-y  \
			--transition-pos "$( hyprctl cursorpos )"

			sleep $INTERVAL
		done
done
