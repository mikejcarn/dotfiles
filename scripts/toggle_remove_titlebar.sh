#! /bin/sh -x
winid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW/ {print $5; exit;}')
current=$(xprop -id $winid | awk '/_MOTIF_WM_HINTS/ { sub(/,/,"",$5); print $5 }')
if [ -z $current ]; then
	current=0
else
	current=$((1 - $current))
fi

xprop -id $winid -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, $current, 0x0, 0x0"
