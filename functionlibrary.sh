#!/bin/bash

function Directory()
{
## GETTING VALUES FROM EACH FILE
MONTH=$(date +%B -r $1)
DAY=$(date +%d -r $1)  
## MAKING DIRECTORY IF NEEDED
if [ ! -d ~/TIMESTAMPS/$MONTH/$DAY ] ;then
    mkdir -p ~/TIMESTAMPS/$MONTH/$DAY
fi
}

function Move()
{
mv $FILE ~/TIMESTAMPS/$MONTH/$DAY
}

function Copy()
{
cp $FILE ~TIMESTAMPS/$MONTH/$DAY
}
