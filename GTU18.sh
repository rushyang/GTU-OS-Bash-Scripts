*******************GTU18*******************
#Write A Script To Perform Following String Operations Using Menu:
#COMPARE TWO STRINGS.
#JOIN TWO STRINGS.
#FIND THE LENGTH OF A GIVEN STRING.
#OCCURRENCE OF CHARACTER AND WORDS
#REVERSE THE STRING.

read -p "Enter String 1: " str1
read -p "Enter String 2: " str2

while true; do
read -p "	1. Compare Two Strings
	2. Join Two String
	3. Find the Length of a given string
	4. Calcucalte the Occurances of a Characters and words
	5. Reverse The String
	6. Exit
	Enter your Choice: " ch
case $ch in 
1)
	if test "$str1" = "$str2"; then
		echo "Both Strings are same"
	else
		echo "Both Strings are no same"
	fi
;;
2)
	echo "$str1$str2"
;;
3)
	echo "Length of a string 1: ${#str1}"
	echo "Length of a string 2: ${#str2}"
;;
4)
	read -p "Enter the character to calculate the occurance: " char
	read -p "Enter the word to calculate the occurance: " word
	
	filetemp1=$(mktemp)
	echo "$str1" > $filetemp1
	filetemp2=$(mktemp)
	echo "$str2" > $filetemp2
	temp1=$(mktemp)
	temp2=$(mktemp)
	grep -o "$char" < $filetemp1 > $temp1
	echo "For string 1: "
	echo "Occurace of a character: " `wc -l < $temp1 | awk '{print $1}'`
	grep -o "$word" < $filetemp1 > $temp2
	echo "Occurance of Word: " `wc -l < $temp2 | awk '{print $1}'`
	echo "For string 2: "
	grep -o "$char" < $filetemp2 > $temp1
	echo "Occurace of a character: " `wc -l < $temp1 | awk '{print $1}'`
	grep -o "$word" < $filetemp2 > $temp2
	echo "Occurance of Word: " `wc -l < $temp2 | awk '{print $1}'`
	rm $filetemp1 $filetemp2 $temp1 $temp2
;;	
5)
	echo "Reverse strings are:" 
	echo "$str1" | rev
	echo "$str2" | rev
;;
6)
	exit
;;
*)
	echo "Invalid Choice.. Try again.." 
;;
esac
done
