# This script will download all the 'Wallpaper Clocks' from vladstudio.com .. Well... only the free ones.. :)
# Build: 11.02.2011
fronturl='http://www.vladstudio.com/wallpaperclock/download.php?wcID='
backurl='&res=1920x1200'
savedir="$HOME/WallpaperClocks"

[[ ! -d "$savedir" ]] && mkdir -p "$savedir"

for id in {2..294}
do
	url="$fronturl$id$backurl"
	wget --trust-server-names "$url" --directory-prefix="$savedir"
done

find "$savedir" -type f -size -102400c -print0 -delete

nautilus "$savedir" &

exit
