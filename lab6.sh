#!/bin/bash
#Andrew Gordon
#Lab 6

#Objective: Create a script called lab6.sh that will check to see if each media file in the medialab directory is in medialab/media.xml.

#    List the filenames in the medialab directory that are not in media.xml
#    Display the number of files in the medialab directory that are not in media.xml
#    List the media files by name in media.xml that do not exist in the medialab directory
#    Display the number of files that are in the media.xml that do not exist in the medialab directory


#Pre-req: Copy /var/share/CS225/cs225-medialab.tar.gz to your home directory and extract it. If you already did this for Lab 5 then skip it.

 
#Desired Output:
#Files not in media.xml:
#file1.mpg
#file2.mpg
#file3.mpg
#Files not in medialab directory:
#file1.mpg
#file2.mpg
#file3.mpg
#3 media files in medialab directory that are NOT listed in media.xml
#3 media files in media.xml that are NOT in medialab directory


LABCOUNT=0
XMLCOUNT=0

IFS=$'\n'
XML=$( grep "filename" ~/medialab/media.xml | cut -f2 -d ">" | cut -f1 -d "<" | sort | uniq )
LAB=$( ls -x1 ~/medialab/ )

echo "medialab files not in media.xml:"
for LABFILE in $LAB ;do
   if ! ( grep -q $LABFILE ~/medialab/media.xml ) ;then
      echo "$LABFILE"
      (( LABCOUNT++ ))
   else
      continue
   fi
done
echo "There were $LABCOUNT file(s) not found in media.xml"


echo "media.xml files not in medialab:"
for XMLFILE in $XML ;do
   if ! [ -e ~/medialab/$XMLFILE ] ;then
      echo "$XMLFILE"
      (( XMLCOUNT++ ))
   else
      continue
   fi
done
echo "There were $XMLCOUNT file(s) not found in medialab"
