************************GTU2************************
#!/usr/bin/env bash
# GTU2b.sh This script will check whether entered number of string is pelindrome or not. (AIO script for numbers, strings, including special characters... So GTU21 and GTU22 is included here.)
# Code written By: Rushyang Darji
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

echo -n "Enter string: "
read string

N=${#string}	# Total no of characters of a string.

mid=$(($N/2))
i=0

while [ $i -lt $mid ]
do
	if [ "${string:$i:1}" != "${string: -$(($i+1)):1}" ];	then	# ${string:$i:1} will check 1 character from "ith" position from front. Note that i starts from 0.
	# ${string: -$(($i+1)):1} will move from back. As i progresses, -$(($i+1)) value gets near to i. 
	# As soon as Any two characters are found unmatched, It will prompt as not pelindrome, and exit quickly.
		echo "String is not a pelindrome"
		exit
	else
		i=$(($i+1))
	fi
done

echo "String is pelindrome"

: << -- OUTPUT 
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: rushyang
String is not a pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: 1234321
String is pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: 12abba21
String is pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: qwejkllkjewq
String is pelindrome
--

#!/usr/bin/env bash
# GTU2c.sh Accept number and check the number is even or odd, finds the length of the number, sum of the digits in the number.
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

echo -n "Enter Number: "  
read no

# Even or odd
i=0
no1=$((${no: -$(($i+1)):1})) # Grabs last digit of no and stores into no1.

a=$(expr "$no1" % 2)  # or `expr "$no1" % 2` 
if test "$a" -eq "0"; then
	echo "Number is Even"
else
	echo "Number is Odd"
fi

# Length of number
count=${#no}
sum=0
echo "No of Digits is: $count"

# Sum of all digits
while [ $count -gt 0 ]
do
	sum=`expr $sum + $((${no:$i:1}))`
	count=$(($count-1))
	i=$(($i+1))
done


echo "Sum of all digits: $sum"

: << -- 
		OUTPUT
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2c.sh 
Enter Number: 123546
Number is Even
No of Digits is: 6
Sum of all digits: 21
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2c.sh 
Enter Number: 8634597 
Number is Odd
No of Digits is: 7
Sum of all digits: 42
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2c.sh 
Enter Number: 0
Number is Even
No of Digits is: 1
Sum of all digits: 0
--

#!/usr/bin/env bash
# GTU2d: Accept strings and replace a string by another string.
# Code written By: Rushyang Darji
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

echo "Enter the Main string: "
read string

temp=$(mktemp)		# mktemp makes temporary file.
echo $string > $temp
echo "You entered..."	# just making sure, whether making temp was successful or not.
cat $temp

echo "Enter sub-string you want to replace..."
read str1

echo "Enter sub-string you want to relace with..."
read str2

sed -n s/$str1/$str2/gp < $temp	
# s stands for "substitution", 
# $str1 is what should be replaced. $str2 is from what $str1 should be replaced. 
# g stands for "Global". Without it, only first match of $str1 will be replaced with $str2, and rest of $str1 will stay as it was.

rm $temp # Removing temp file.

: << -- 
	OUTPUT
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2d.sh 
Enter the Main string: 
The old fox jumps over the big rock.
You entered...
The old fox jumps over the big rock.
Enter sub-string you want to replace...
fox
Enter sub-string you want to relace with...
frog
The old frog jumps over the big rock.
--

#!/usr/bin/env bash
# GTU2e.sh Accept filename and displays last modification time if file exists, otherwise display appropriate message.
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.


echo "Enter the filename"
read FILE

if [ -f $FILE ]; then
	echo "The file exists."
	echo "Last modification time is." 
	ls -l $FILE | awk '{print $6" "$7}' # prints 6th and 7th column from tabular result of ls -l
else
	echo "The file does not exist"
fi


#!/usr/bin/env bash
# GTU 2: Fetch the data from a file and display data into another file in reverse order
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.
ls
echo "Enter a filename: "
read FILE

temp=$(mktemp tmp.XXXXX)
if [ -f $FILE ]; then
	rev $FILE > $temp
	echo "Data successfully fetched into $temp"
	cat $temp
else
	echo "File does not exist"
fi

rm -i $temp
