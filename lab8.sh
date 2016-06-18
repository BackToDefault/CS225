#!/bin/bash
#Andrew Gordon
#Lab 8

#Objective: Using the last line of /var/share/CS225/addresses.csv gather each field into the following variables using bash pattern substitution. Do NOT use awk for this!

#    FNAME
#    LNAME
#    COMPANY
#    STREET
#    CITY
#    STATE
#    ZIP
#    HPHONE
#    WPHONE
#    EMAIL
#    WEBURL

a=/var/share/CS225/addresses.csv
if [ ! -f $a ] ;then
	echo "$a not present"
	exit
else
	LINE=$(tail -n -1 $a)
	for PART in FNAME LNAME COMPANY STREET CITY COUNTY STATE ZIP HPHONE WPHONE EMAIL WEBURL ;do
		LINE=${LINE#\"}
		eval ${PART}='"${LINE%%\"*}"'
		LINE=${LINE#*,}
	done
	echo "FIRST NAME: $FNAME"
	echo "LAST NAME: $LNAME"
	echo "COMPANY: $COMPANY"
	echo "STREET: $STREET"
	echo "CITY: $CITY"
	echo "STATE: $STATE"
	echo "ZIP: $ZIP"
	echo "HOME PHONE: $HPHONE"
	echo "WORK PHONE: $WPHONE"
	echo "EMAIL: $EMAIL"
	echo "URL: $WEBURL"
fi
