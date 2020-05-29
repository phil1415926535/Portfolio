#!/bin/bash

echo "*** `date '+%Y %b %d  %a  %T%p %Z'` ****" >> outlist.txt
echo "*** `date '+%d %b %Y  %a  %T%p %Z'` ****"

date '+%Y-%b-%d %T%p'

TIMESTAMP=`date +%Y%b%d_%T%p`
echo $TIMESTAMP

date +%Y%b%d_%Hh%Mm

YYYYMMDD=`date '+%d-%m-%Y'`
TIME=`date '+%Hh:%Mm:%Ss'`
echo $YYYYMMDD --- $TIME

date
date +%Y%b%d_%T%p

echo .


echo -e "\e[33mHow many files in the Week3 directory??????\e[0m"
sleep 1
echo "???"
sleep 1
echo "Doing the sums...."
sleep 1
echo "this is taking a while..."
sleep 1
echo "getting bored"
sleep 1
echo "come on already"
sleep 1
echo "are we there yet are we there yet are we there yet"
sleep 1
echo "Finally; the number of files is: "

find  ~/student/scripts/portfolio -type f -exec file {} \; > anotherFile.txt
R1=$(cat anotherFile.txt)
cat anotherFile.txt | grep "/student/scripts/portfolio/" | wc -l

echo "Number of files from command history"
history > outputFile.txt
R1=$(cat outputFile.txt)
$R1 | grep "cp" | wc -l

# Terminal colours
RED="\e[31m"
YELLOW="\e[33m"
NORMAL="\e[0m"
GREEN="\e[92m"
 
# Disable terminal colours if "--nocolor" flag is passed as last argument:
LASTARG="${@: -1}"
if [ "${LASTARG}" == "--nocolor" ];
then
    RED=""
    YELLOW=""
    NORMAL=""
    GREEN=""
fi
 
# Now you can safely write colors with:
echo -e "* File outputfile.txt ${YELLOW}already patched${NORMAL} ${GREEN}[success]${NORMAL}\n"