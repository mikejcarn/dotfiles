#!/bin/bash
# Script to set a per workspace desktop background in Cinnamon.
# Save as ~/bin/workspace_backgrounds_switcher.sh or ~/.local/bin/workspace_backgrounds_switcher.sh and make executable
# Add an entry in startup applications to launch the script on start-up.

# Set your images here - one per active workspace.
# Add extra WORKSPACE_BACKGROUND[X] entries as necessary.

# Space theme
# WORKSPACE_BACKGROUND[0]="/home/acorn/Pictures/Workspace_Images/space1.jpg"
# WORKSPACE_BACKGROUND[1]="/home/acorn/Pictures/Workspace_Images/space2.jpg"
# WORKSPACE_BACKGROUND[2]="/home/acorn/Pictures/Workspace_Images/space3.jpg"
# WORKSPACE_BACKGROUND[3]="/home/acorn/Pictures/Workspace_Images/space4.jpg"

# Spacegirl theme
WORKSPACE_BACKGROUND[0]="$HOME/Pictures/workspace-images/ed1.jpg"
WORKSPACE_BACKGROUND[1]="$HOME/Pictures/workspace-images/ed2.jpg"
WORKSPACE_BACKGROUND[2]="$HOME/Pictures/workspace-images/ed3.jpg"
WORKSPACE_BACKGROUND[3]="$HOME/Pictures/workspace-images/ed4.jpg"

# Main script starts here
# Check for existing instances and kill them leaving current instance running
for PID in $(pidof -o %PPID -x "${0##*/}"); do
	if [ "$PID" != $$ ]; then
		kill -9 "$PID"
	fi
done
# Monitor for workspace changes and set the background on change.
xprop -root -spy _NET_CURRENT_DESKTOP | while read -r; do
	WORKSPACE=$(echo ${REPLY} | cut -d" " -f3)
	gsettings set org.cinnamon.desktop.background picture-uri "file://${WORKSPACE_BACKGROUND[$WORKSPACE]}"
done
