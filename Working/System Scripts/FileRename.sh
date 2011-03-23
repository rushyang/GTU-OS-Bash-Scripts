# This script is made again to Rename files.
# Algo:
# 1. Go to the folder.
# 2. Make the Temp Directory
# 3. Ask From 

while true; do
	read -e -p "Let\'s go to that directory.. Enter the path: " apath || exit
	[[ -d $apath ]] && break
	echo "Invalid Path."
done

mypwd=echo `pwd`
cd $apath

