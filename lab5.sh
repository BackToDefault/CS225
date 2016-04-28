#!/bin/bash

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

