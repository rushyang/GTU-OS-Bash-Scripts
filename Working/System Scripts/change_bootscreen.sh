# This script is made with the purpose of changing the boot screen in ubuntu, lucid lynx.
#The plymouth theme uses a theme framework to display the background and animation, so you won’t be able to take a simple wallpaper and put it on the boot screen. The Ubuntu repository comes with several plymouth themes that you can install in your system.
# Author: Rushyang Darji
# Build: 09.08.2010

sudo apt-get install plymouth-theme-*

echo "Please select the selection number: "
sudo update-alternatives --config default.plymouth
