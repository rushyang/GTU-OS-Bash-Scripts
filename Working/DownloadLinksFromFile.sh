file1=`zenity --file-selection`
savedir='/media/Rushyang/wget_project/Stayaway'

while read -r line
do
	wget $line --directory-prefix="$savedir"

done < "$file1"
