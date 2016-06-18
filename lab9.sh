#!/bin/bash
#Lab 9
#Andrew Gordon
#Objective: Create a script that parses commandline arguments and options.

#    Create a script named lab9.sh
#    The script should take these options
#        -d - turns on debugging (set -x)
#        -v - sets the VERBOSE variable to true
#        -h - prints out a help message with the name of the script (and no path information) plus the options
#        -n <name> - takes a name argument and prints a message on the screen
#        -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)
#        any other options - prints the help message and exits
#    Puts all additional arguments in $1 $2 etc.

  

#Needed:

#    while
#    case
#    getopts
#    parameter expansion
#    shift
#    set

while getopts :h:l:d:n:v opt ;do
  case $opt in
    # debugging  
    d) set -x ;;
    # set verbose to true
    v) VERBOSE=true ;;
    # help
    h) echo  "
             Usage: ${0##/*} <OPTION> <NAME>
             Script that parses command line arguments and options
             d: turn debugging on
             v: verbose
             n: set name as argument
             l: list directory
             " ;; 
    # argument name
    n) NAME=$OPTARG ;;
    # list directory
    l) LIST=$OPTARG 
       echo "Would you like to list directory? (Y/n)" 
       read CHOICE;;
    # error for non-option
    \?) echo "ERROR: Unknown Option" ;;
  esac
done

shift $((OPTIND-1))

if [[ ! -z "$LIST" ]] && [[ $CHOICE = "Y" ]] ;then
     if [[ ! -z "$VERBOSE" ]] ;then
          ls -l $LIST
     else
          ls $LIST
     fi
fi
