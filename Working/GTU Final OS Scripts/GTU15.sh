**************************GTU15********************
#Write a script which reads a text file and output the following
#Count of character, words and lines.
#File in reverse.
#Frequency of particular word in the file.
#Lower case letter in place of upper case letter.

read -e -p "Enter the filename: " file1 

if [[ -f $file1 ]]; then
	echo "Filename is \"$file1\". "
	echo "Count of Characters: " `wc -m < "$file1"`
	echo "Count of Words: " `wc -w < "$file1"`
	echo "Count of Lines: " `wc -l < "$file1"`

	echo "Reverse File is: "
	rev "$file1" | tac

	read -p "Enter the word which you want to count frequency of: "	aword
	frq=`grep -c "$aword" < "$file1"`
	echo "Frequency of word \"$aword\" is: $frq"

	echo "Converting all lower case to upper case.."
	tr [:upper:] [:lower:] < "$file1"
fi


