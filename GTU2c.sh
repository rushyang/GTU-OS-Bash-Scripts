#!/usr/bin/env bash
# GTU2c.sh Accept number and check the number is even or odd, finds the length of the number, sum of the digits in the number.
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

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
