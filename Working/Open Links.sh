read -e -p "Enter the file: " file1 

while read -r line
do
	line2=`echo $line | grep http`
	if [[ "$line2" != '' ]]; then
		firefox "$line2" 1>/dev/null 2>&1 &
		sleep 6
	fi
done < "$file1"
