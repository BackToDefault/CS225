#!/bin/bash
if [ $UID -lt 500 ]
then
	echo "It is not safe to run this script as root"
elif [ $UID -ge 500 ]
then
	echo "Valid user"
	HOME=$(grep $UID /etc/passwd | cut -d ":" -f6)
	du -sh $HOME
else
	echo "How did you get here?"
fi
