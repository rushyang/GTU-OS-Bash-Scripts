# This script will split all links into individual file per 30 links
N=0
i=1
read -e -p "Enter the Absolute Path to data file: " file1
while read -r line
do
	echo "$line" >> "$i"
	N=$(($N+1))
	
	if [[ $N = 30 ]]; then
		N=0
		i=$(($i+1))
	fi
done < "$file1"
