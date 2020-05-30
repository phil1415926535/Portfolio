#!/bin/bash

while true;
do
echo "Type a URL to download or type “exit” to quit."
read -p "Address: " URL

    if [[ $URL == "exit" ]];
        then
            exit 0
    else
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
    fi
wget -P $loc $URL
done
