#!/usr/bin/env bash
# This script constantly checks the clipboard content and if new entry is found, then will copy that into a specific file
while true; do
	targetfile=`zenity --entry --text="Enter the file name: " --title="Initiating Capture Clipboard Script.." --width=400`
	[[ -z "$targetfile" ]] && exit
	gather="$HOME/$targetfile"
	[[ -f $gather ]] && dup=`zenity --question --text="This file already exists, Are you sure you want to continue?" --width=500; echo $?`
	[[ "$dup" -ne "1" ]] && break
done
echo '' | xclip -selection clipboard
while true; do
	content=`xclip -selection clipboard -o`
	if [[ "$content" != '' ]]; then
		if [[ "$content" = 'exit' ]]; then
			notify-send "Capture Script Terminated!" -i gtk-dialog-info && exit
		fi
		echo "$content" >> "$gather"
		echo '' | xclip -selection clipboard
		#zenity --notification --timeout=1 && sleep 1
	fi
	sleep 1 #Vital to reduce the processor load
done
