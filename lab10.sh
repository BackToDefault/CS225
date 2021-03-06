#!/bin/bash
#Lab 10
#Andrew Gordon

#Objective: Create a script that does work and cleans up if forced to exit

#    Script should list all files one per line in the entire OS
#    The filelist should be stored in a temporary file
#    If a user presses control-c a function will clean up the temporary file and exit

 

#Output:

#     File 1:  testfile.sh

#     File 2:  testfile2.sh

#     ....

 

#Items to use:

#    traps
#    functions
#    conditionals
#    loops
#    mktemp


FLIST=$(find / -type f)
OSTEMP=$(mktemp)

cleanup()
{
	rm -f $OSTEMP
	exit 1
}

for LINE in $FLIST ;do
	((COUNT++))
	FILE=${LINE##*/}
	echo "File $COUNT: $FILE" >> $OSTEMP
done

echo "$COUNT files in the entire OS. Would you like to view the list? (y/n)"
read VIEW

if [[ $V = "y" ]] ;then
	less $OSTEMP
fi

echo "Save list in your home directory? (y/n)"
read S
if [[ $S = "y" ]] ;then
	cat $OSTEMP > /$HOME/OSFILES.txt
fi

trap cleanup SIGINT
