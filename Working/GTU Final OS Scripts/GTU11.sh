************************GTU11************************
while true; do
	read -e -p "Enter first Directory's Absolute path: " path
	[[ -d $path1 ]] && break
		echo "Invalid path, Try Again!"
done

ls -Sl $path # this will list all files in descending order... 

ls -Sl $path | tac # This will list all files in ascending order....

#####or

cd $path
ls * -dplSr | grep -v '/$'
cd $OLDPATH
