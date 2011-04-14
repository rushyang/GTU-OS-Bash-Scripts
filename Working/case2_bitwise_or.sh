# This shell script is made with the purpose of explaining BITWISE operator OR.
# Developed By: Rushyang Darji
# Build: 12.08.2010

echo -n "Enter any number from 1 to 7: "
read no

case $no in 

[12345])

	echo "You entered any number from 1 to 5"
;;

6|7)
	echo "You entered 6 or 7"
;;

*)	
	echo "You are not smart!! Go kill yourself and free this earth!"
;;

esac
