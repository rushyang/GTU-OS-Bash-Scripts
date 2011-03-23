#! /bin/bash
temp=$(mktemp history.XXXX)
cp "$HOME/.bash_history" "$temp"

# Fetchng today's date.
now=`date +%d%b%Y_%H`

# My History back up directory location
histdir="$HOME/Experiments/AutoHistBackup"
if [[ ! -d $histdir ]]; then
	mkdir -p "$histdir"
fi
month=`date +%Y_%b`

path="$histdir/$month"

if [[ -d "$path" ]]; then
	mv "$temp" "$path"
	mv "$path/$temp" "$path/$now"
else
	mkdir "$histdir/$month"
	mv "$temp" "$path"
	mv "$path/$temp" "$path/$now"
fi

ls "$path/"
