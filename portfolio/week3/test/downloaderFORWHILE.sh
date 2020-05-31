#!/bin/bash

while true;
do

echo "Type URL to download or “exit” to quit :"
read -p "Address: " URL
    if [[ $URL == "exit" ]];
    then
        echo "Goodbye!"
        exit
    fi

read -p "Type a download directory location: " loc
    if [[ -d $loc ]];
    then
        read -p "Use existing directory? (y/n): " yn
            if [[ $yn == n ]];
                then
                    exit
            else
                mkdir $loc
            fi
    fi

# To allows multiple URL's to be entered with exit at the end to exit when finished
    for dl in $URL
    do
        if [[ $dl == "exit" ]];
        then
            echo "Goodbye!"
            exit
        else
            wget -nv --show-progress -P $loc $dl   
        fi     
    done
done

# References:
# https://www.gnu.org/software/wget/manual/wget.html#Download-Options
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html