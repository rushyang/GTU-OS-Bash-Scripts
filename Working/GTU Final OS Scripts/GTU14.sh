***********************GTU14***********************
#!/usr/bin/env bash
# Code written By: Rushyang Darji
# Last Updated: 13.08.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.
: << -- 
14. Write a script to make following file and directory management operations menu based:
	Display current directory
	List directory
	Make directory
	Change directory
	Copy a file
	Rename a file
	Delete a file
	Edit a file
--

while true; do


sleep 1
echo -e "\n"
echo -e "	1. Display current directory
	2. List directory
	3. Make directory
	4. Change directory
	5. Copy a file
	6. Rename a file
	7. Delete a file
	8. Edit a file
	9. Exit
	Enter your choice: \c"
read selection
clear

case $selection in 

1) pwd
;;

2) ls -l
;;

3) echo -n "Enter name of directory you wanna make: "
read DIR
mkdir "$DIR"
if [ "$?" == "0" ]; then
	echo "Directory $DIR made successfully!"
	sleep 1
	ls -l
fi
;;

4) echo -n "Enter the Absolute Path to change the directory: "
read -e apath
cd $apath
	if [ $? -eq 0 ]; then 
		echo "Working path changed successfully!"
		sleep 1
		pwd
	fi
;;

5) echo -n "Enter name of file: "
read filename
echo -n "Copy where? "
read -e apath
cp $filename $apath

if [ $? -eq 0 ]; then
	sleep 1
	echo "File $filename copied successfully to $apath"
fi
;;

6) echo -n "Enter old name of the file: "
read oname
echo -n "Enter new name: "
read nname
mv $oname $nname
;;

7) echo -n "Enter filename to delete: "
read fdel
if [ -f $fdel ]; then
	rm -i $fdel
fi
;;

8) echo -n "Enter filename to open it in Text Editor: "
read filename
vi $filename
;;

9) 
clear
echo "============ HAVE A NICE DAY ============"
sleep 2 
clear
exit
;;

*) echo "Invalid choice, Please try again!: "
;;

esac
done
