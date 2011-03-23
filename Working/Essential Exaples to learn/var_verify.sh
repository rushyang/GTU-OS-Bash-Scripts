EXIT=no
while [ "$EXIT"!="YES" ]
do
echo "Please Enter Variable"
read myvar

if [ -z $myvar ]; then
	echo -n "You didn't enter anything. "
else
	echo "You entered... $myvar"
	exit
fi
done
