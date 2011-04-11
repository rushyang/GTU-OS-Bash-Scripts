# !/usr/bin/env bash
# This is my experiment on an array...

# -r for preventing upcoming backslashes as a use of an escape sequence
# -d is the delimeter '\0' is the NULL character from the STREAM.
# There are two kind of data used.. Since bash is written in C, all functions uses the string (NOT STREAM), and it does not allow the NULL bytes.. 
# and while find gives the matched single pattern in continuous STREAM, it allows the NULL bytes as in filename & thus can contain the spaces.
# And to catch those spaces we use the delimeter and -print0
files=()
while read -r -d $'\0'; do
	files+=("$REPLY")
done < <(find "/media/Rushyang/Movies/Completed/" -name "*.mkv" -print0)
# Finally, the < <(..) syntax is the combinations of file Redirection (<) and Process Substitution (<(..)) which is used to redirect the output of the find command into our while loop.

totalfiles=0
for i in "${files[@]}"; do
	echo "$i"
	totalfiles=$(( $totalfiles+1 ))
done

echo 'Total No of matched files found: ' $totalfiles
