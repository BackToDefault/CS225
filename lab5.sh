#!/bin/bash
#Andrew Gordon
#Lab 5

#Objective:  Loop through data and act on each entry
#    Loop through the items in medialist.txt
#    Check to see if each item exists in the medialab directory
#    If it does output the name to a new file called foundfiles.txt
#    if it doesn't output the name to a new file called lostfiles.txt
#    save your script as lab5.sh

#Pre-reqs: 
#    copy /var/share/CS225/cs225-medialab.tar.gz to your home directory
#    extract cs225-medialab.tar.gz 

MEDIA=$(cat ~/medialab/medialist.txt)

IFS=$'\n'

> ~/foundfiles.txt
> ~/lostfiles.txt

for file in $MEDIA ;do
	if ( ls ~/medialab | grep "$file" ) ;then
		echo "$file" >> ~/foundfiles.txt
	else
		echo "$file not found"
		echo "$file" >> ~/lostfiles.txt
	fi
done

