#
#	Author: Rushyang Darji
#	Date: 	04.08.2010
#	
#	001 - This script will print the multiplication table of user entered number.
#

echo -n "Enter number: "
read n
i=1
for(( i=1; i<=10; i++ ))
do
	echo -e "$n x $i \t=\t `expr $i \* $n`" | fmt -u
done
