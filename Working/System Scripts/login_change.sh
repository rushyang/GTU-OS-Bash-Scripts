# This script is made with the purpose of changing login screen of Lucid Lynx. 
# Make sure to pass your image name perfectly as parameter.
# Author: Rushyang Darji
# Build: 09.08.2010

if [ $# -eq 0 ]; then

	echo "Please pass wallpaper name as parameter 
& make sure that wallpaper is in current directory."

elif [ $# -eq 1 ]; then

wallpaper=$1
echo "Moving your wallpaper into /user/share/backgrounds"
sleep 1
echo -n "3..."
sleep 1
echo -n "2..."
sleep 1
echo -n "1"
sleep 1
sudo mv $wallpaper /usr/share/backgrounds
echo -e "\nDONE!"

echo "Activating new Appearance window upon login. Please Wait..."
sleep 1
echo -n "3..."
sleep 1
echo -n "2..."
sleep 1
echo -n "1"
sleep 1
sudo cp /usr/share/applications/gnome-appearance-properties.desktop /usr/share/gdm/autostart/LoginWindow

echo -e "\n\nYour current wallpaper from gnome appearance properties has been fetched to Login Window. 
Please confirm your wallpaper there!"
sleep 5
echo -e "\nLoggin off now.." 
sleep 2
gnome-session-save --logout-dialog



#echo "Your current wallpaper from gnome appearance properties has been fetched to Login Window. 
#Do You want to log off now and select it? (Y/n) "
#read ch
#
#	if [ $ch -eq "y" ]; then
#		echo "Loggin off now.." 
#		sleep 2
#		gnome-session-save --logout-dialog
#	fi
#
else

	echo "Invalid no. of parameters."
fi

# After you run the script, open run and execute following command.
# sudo unlink /usr/share/gdm/autostart/LoginWindow/gnome-appearance-properties.desktop
