#!/bin/bash

#If there aren't three arguments to the script
if (( $#!=3 )); then
    #Print an error and exit
    echo "Error, provide three numbers only" && exit 1
fi
#For every number between the first argument and the last
for ((i = $1; i <= $3; i++))
do
    #Create a new folder for that number
    echo "Creating directory number $i"
    mkdir "../week$i"
done