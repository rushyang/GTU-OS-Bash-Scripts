#<< -- This script will remove all history of echo from once's history usage.
# Author: Rushyang Darji
# Init Build: 15082010
# Last Build: 19082010
# Version: 1.3
# Version history:
# v1.3: Added uniq command list
: << --
cd $HOME
today=`date +%d%m%Y`
backdir='/home/rushyang/historybackup'

touch $backfile
if [ -d $backdir ]; then
	cp .bash_history $backdir
else
	mkdir -p $backdir
	cp .bash_history $backdir
fi
cd $backdir
mv .bash_history $today
--
cd $HOME

cat .bash_history | grep -v ^echo > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All echo usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi


cd $HOME
cat .bash_history | grep -v ^clear > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All clear usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi

cd $HOME
cat .bash_history | grep -v ^bash > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All bash usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi

cd $HOME
cat .bash_history | grep -v ^ls > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All ls usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi


cd $HOME
cat .bash_history | grep -v ^cat > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All cat usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi

cd $HOME
cat .bash_history | grep -v ^mkdir > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All mkdir usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi

cd $HOME
cat .bash_history | grep -v ^exit > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All exit usage removed from your history!"
	#sleep 1
else
	echo "Something's wrong"
fi

cd $HOME
cat .bash_history | uniq > .bash_history_backup
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All commands are now unique in your history!"
	#sleep 1
else
	echo "Something's wrong to set them unique"
fi

cd $HOME
cat .bash_history | grep -v ^gedit > .bash_history_backup
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "All gedit usage removed!"
	#sleep 1
else
	echo "Something's wrong to set them unique"
fi

exit


