# This script is for understaing usage of detecting exitence of file of directory.
# In other words, It's a 'Check the Return Code' 
# Author: Rushyang Darji
# Build: 18.08.2010
# 

echo "Enter Absolute path: "
read apath

if [ -d $apath ]; then
	echo "It's a Directory"
elif [ -f $apath ]; 
then	
	echo "It's a File"
else
	echo "Check your path"
fi
