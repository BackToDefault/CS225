#!/bin/bash
#Andrew Gordon
#5/26/2016
#CS225
#Lab 12

#Objective: Create a script with a pseudo multi-dimensional array

#Create a script that:
#Reads in /var/share/CS225/addresses.csv and parses the various parts into separate arrays
#Loops through resulting arrays and prints data back onto the screen in the same format as addresses.csv
#For example:

#"Byron","Fortuna","Jackson & Collins Pa","700 Sw Higgins Ave","Missoula","Missoula"
#LNAME[1] should be Byron
#FNAME[1] should be Fortuna 
#When you get done you should have an array for each column and each item number should correspond to a row. Print the results back out by iterating through the NUMBER of rows (get from one of the arrays ${#LNAME[@]}).

#Script has to include the following:
#-trap for control-c
#-uses pattern substitution
#-uses arrays
trap INT


IFS=$'\n'
C="0"
BOOK=$(tail -n +2 /var/share/CS225/addresses.csv)
for LINE in $BOOK ;do
  ((C++))
  LINE=${LINE#\"}
  FNAME[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}

  LNAME[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}

  COMPANY[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
	
  STREET[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  CITY[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  COUNTY[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  STATE[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  ZIP[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  HPHONE[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  WPHONE[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  EMAIL[${C}]=${LINE%%\"*}
  LINE=${LINE#*,\"}
    
  WEBURL[${C}]=${LINE%%\"*}
done

echo ${#ZIP[@]}


#Code Graveyard
#if [[ ! -z $1 ]] ;then
#  if [[ $1 -le $C ]] ;then
#  echo "FIRST NAME:    ${FNAME[$1]}"
#  echo "LAST NAME:     ${LNAME[$1]}"
#  echo "COMPANY:       ${COMPANY[$1]}"
#  echo "STREET:        ${STREET[$1]}"
#  echo "CITY:          ${CITY[$1]}"
#  echo "STATE:         ${STATE[$1]}"
#  echo "ZIP:           ${ZIP[$1]}"
#  echo "HOME PHONE:    ${HPHONE[$1]}"
#  echo "WORK PHONE:    ${WPHONE[$1]}"
#  echo "EMAIL:         ${EMAIL[$1]}"
#  echo "URL:           ${WEBURL[$1]}"
#  else
#  echo "ERROR: $1 is not a line in address book."
#  fi
#fi
