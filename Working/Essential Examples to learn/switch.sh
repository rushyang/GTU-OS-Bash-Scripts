# This is a test to learn case in shell scripts.
# Task: This script will check whether user has entered 1 or 2.
# Build: 12.08.2010

echo -n "Enter the number: " 
read no

case $no in 
1) echo "You entered 1"
;;
2) echo "You entered 2"
;;
*) echo "You did not enter 1 or 2"
;;
esac

