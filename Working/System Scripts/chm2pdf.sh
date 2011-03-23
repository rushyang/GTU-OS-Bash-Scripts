echo "Do you want to change pwd? (y or n)"
read opt
if test $opt == "y"; then
	read cpath
	if test -d $cpath; then
		cd $cpath
		proc = $?
	else
		echo "No Such a absolute path exists"
	fi
fi
echo $proc
if [ "$proc" -eq "0" ]; then

ls
echo "Enter chm book name to convert"
read name
extract_chmLib $name $$
echo "CHM pages extracted to $$"

else
	echo "Error Detected.. Exiting.."
fi
