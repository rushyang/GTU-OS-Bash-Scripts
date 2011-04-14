#!/usr/bin/env bash
read -e -p "Directory:" savedir
files=()
while read -r -d $'\0'; do
	files+=("$REPLY")
done < <(find "$savedir" -type f -size +40960000c -print0)
# Finally, the < <(..) syntax is the combinations of file Redirection (<) and Process Substitution (<(..)) which is used to redirect the output of the find command into our while loop.

totalfiles=0
for i in "${files[@]}"; do
	echo "$i" >> /home/rushyang/longestlog
	totalfiles=$(( $totalfiles+1 ))
done

echo 'Total No of matched files found: ' $totalfiles

