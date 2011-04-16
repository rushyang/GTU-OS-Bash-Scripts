#! /bin/bash
#: << -- This script is made with purpose to automate my download in ubuntu at night.
#logfile=`date +%d%m%Y_log`
savedir='/media/500Pri/SmallWonder'
GETREADY=`wget -c --tries=200 --trust-server-names --load-cookies /media/Rushyang/wget_downloads/cookies.txt -i Links.list --directory-prefix="$savedir"`
eval $GETREADY
sudo halt
