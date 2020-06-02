#!/bin/bash

#If there aren't three arguments to the script
if (( $#!=3 )); then
    #Print an error and exit
    echo "Error, provide three numbers only" && exit 1
fi

echo "About to make the folder in portfolio directory: " 
        
for nbr in $*
do
    echo "week$nbr"
done
        
echo "Is this correct?: "
read -p "y/n?: " yn

    if [[ $yn != y ]];
    then
        exit
    fi


#For every number between the first argument and the last
for ((i=$1;i<=$3;i++))
do
    #Create a new folder for that number
    echo "Creating directory number $i"
    mkdir "../week$i"

done

echo "Done"
sleep 1