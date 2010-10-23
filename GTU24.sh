#!/usr/bin/env bash
# GTU24: Write a script to display the last modified file.
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
# Final Build: 19.10.2010

while true; 
do
  # -e enables readline, which means you can use tab-completion. & -p prints whatever's written in "" before taking the path
  # The ''|| exit'' makes the script exit if read returns false, which it
  # will if the user hits Ctrl+C amongst other.
	read -e -p "Enter Directory: " path || exit
  # if path contains an existing directory, break out of this infinite loop.
	[[ -d $path ]] && break
	echo "Invalid Path, Try Again!"
done

cd $path	# cd $path is inevitable because of * in use of ls.
ls * -dpltr | grep -v '/$' | tail -n1
  # Here, observe '*' after ls. You must specify a wildcard pattern for indicating all files first. 
  # This is because the -d option specifies that only directory names should listed. 
  # Moreover, -p puts an indicator at the end of "directories", which will be stripped by grep inverse. 
  # Once we have neglected directories, we can list(-l) "ONLY FILES" from current working directory sorted by it's modified time (-t) in reverse order (-r). The most last one will be fetched by tail. 

cd $OLDPWD
  # OLDPWD is the env var, which always remembers our "PREVIOUS WORKING DIRECTORY". Enter `env | grep OLDPWD` to see it. 
  # 'cd -' will also lead us into last working directory. But then also we don't need to print it on Terminal while executing it.
