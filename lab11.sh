#!/bin/bash

#Andrew Gordon
#CS225 Lab 11

#Objective: Start building a function library 
#Pre-req: copy /var/share/CS225/timefiles.tar.gz to your home directory and extract it

#Create a script that:
#-looks at the modified timestamp of each file in timefiles
#-creates a directory structure for the month and day in your home directory
#-copies each file to the appropriate directory
#-moves each file to the appropriate directory if -f (force) is set

#Script has to include the following:
#-syntax/help function
#-getopts options 
#-trap for control-c
#-function library for generic functions (check timestamp, create directory, print syntax etc..)
#-uses pattern substitution

IFS=$'\n'
## Trap for ctrl+c
trap "echo You have been trapped" INT

while getopts :hf opt ;do
  case $opt in
    # help
    h) echo  "
        Usage: ${0##*/} <OPTION> <NAME>
        
        Script that copies files from the timefiles directory to new directories depending             on the month and day of the timestamp
        
     
             -f          move files instead of copy             
             " ;; 
    # move instead of copy
    f) MODE=MOVE ;;
    # error for non-option
    \?) echo "ERROR: Unknown Option"
  esac
done
shift $((OPTIND-1))

## calling function library
TIMEDIR=$( ls -1 ~/timefiles/* )
for FILE in $TIMEDIR ;do
  source ~/Projects/CS225/functionlibrary.sh
  Directory ${FILE}
  if [ MODE=MOVE ] ;then
    Move ${FILE}
  else
    Copy ${FILE}
  fi 
done
