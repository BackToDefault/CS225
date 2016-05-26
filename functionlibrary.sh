#!/bin/bash
#Andrew Gordon
#CS225
#Lab 11 - functionlibrary.sh

#function Prep does two things:
#-Retrieves the timestamp (MONTH and DAY) of file
#-Creates destination directory if it does not exist
Timestamp()
{
MONTH=$(date +%B -r $1)
DAY=$(date +%d -r $1)
}

Directory()
{
if [ ! -d $DEST ] ;then
  mkdir -p $DEST
fi
}

Move()
{
mv $1 $2
}

Copy()
{
cp -a $1 $2
}
