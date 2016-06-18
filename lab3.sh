#!/bin/bash
#Andrew Gordon
#Lab 3

#Objective:  Check a users ID and if they're root then display a message saying it's insecure to run this script as root. If they are not root then get their home directory from the /etc/password file and display the size of the contents of it. 
#
#    Get the users ID
#    Exit if the user is root
#    If the user is not root make sure their userid is larger than 500
#    Check to see if /etc/password exists and is readable
#    Get the users home directory from /etc/passwd
#    Display the size of their home directory
#
#Commands to use:
#
#    Conditionals
#    BASH environment variables
#    cat
#    grep/awk?
#    echo
#    du


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
