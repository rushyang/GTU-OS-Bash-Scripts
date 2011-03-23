# This script constantly checks the clipboard content and if new entry is found, then will copy that into a specific file
gather='/home/rushyang/Aarav23032011'
if [[ ! -f $gather ]]; then
	touch $gather
fi
echo '' | xclip -selection clipboard
old=''
while true; do
	content=`xclip -selection clipboard -o`
	if [[ "$old" != "$content" ]]; then
		if [[ "$content" = 'exit' ]]; then
			exit
		fi
		echo "$content" >> "$gather"
		old=`echo $content`
	fi
	sleep 1
done
