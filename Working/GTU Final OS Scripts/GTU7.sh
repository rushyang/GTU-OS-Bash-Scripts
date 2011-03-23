************************GTU7************************
#!/usr/bin/env bash
# Code Developed By: Rushyang Darji
# Last Build: 14.09.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.
while true; do
	read -e -p "Enter the Absolute Path: " path || exit
	[[ -d $path ]] && break
	echo "Invalid Directory!"
done


args=`find "$path" -empty -print0 | xargs -0`
for i in $args
do
	if [ -f "$i" ]; then
		rm -i "$i"
	fi
done

