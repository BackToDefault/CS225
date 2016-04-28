#!/bin/bash
LABCOUNT=0
XMLCOUNT=0

IFS=$'\n'
XML=$( grep "filename" ~/medialab/media.xml | cut -f2 -d ">" | cut -f1 -d "<" | sort | uniq ) 2>&1
LAB=$( ls -x1 ~/medialab/ )

echo "medialab files not in media.xml:"
for LABFILE in $LAB ;do
   if ! ( grep -q $LABFILE ~/medialab/media.xml ) && ! [[ -z $LABFILE ]] ;then
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
