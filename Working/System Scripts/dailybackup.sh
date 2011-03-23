: << -- This is script 'for' backing up my files
Developed By: Rushyang Darji
Init Build: 13.08.2010
Last Build: 13.08.2010
Version: 1.0 BETA
--

echo "Welcome to your daily backup!"
echo -n "Press ENTER to continue: "
read dummy

maindir=/media/Rushyang/Study\ Hard\ \!\!/Backup/
sourcedir=/home/rushyang/Working/
linkdir=/media/Seagate/Study\ Drive/MCA
cp -uR $sourcedir/* $maindir
if [ $? -eq 0 ]; then
	clear
	echo "All files are copied successfully!"
	sleep 1
	echo $sourcedir
	ls -lR $sourcedir | less

	echo $maindir
	ls -lR $maindir | less
else
	echo "Something's wrong."
fi

cp -uR $sourcedir/* $linkdir
if [ $? -eq 0 ]; then
	echo "All files are copied successfully!"
	sleep 1
	ls -lR $sourcedir | less
	ls -lR $linkdir | less
else
	echo "Something's wrong."
fi

