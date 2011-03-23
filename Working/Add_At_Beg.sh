# A Shell Script to add whatever user writes, at the beginning of Text File, exist in the SAME directory.
#
# Author: Rushyang Darji

mydir="$HOME/Experiments" #  HOME is the environment variable. To view it's path, type $env | grep HOME
cd $mydir

echo "Enter anything"
read string 		# Will read until "Return" is pressed.

echo $string > temp	# Creates a new temp, if doesn't exist. Over writes, if it does exist.

cat File >> temp	# Appends File contents to temp.

mv temp File		# Renames temp to File.

clear
echo "Now, File contains..."
cat File 	#Or less File Or more File. Whatever.
