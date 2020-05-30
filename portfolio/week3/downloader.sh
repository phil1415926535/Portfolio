#!/bin/bash

while true;
do
echo "Type URL to download or “exit” to quit :"
read -p "Address: " URL

    if [[ $URL == "exit" ]];
        then
            echo "Goodbye!"
            exit
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
wget --show-progress -P "$loc" "$URL"
done
# References:
# https://www.gnu.org/software/wget/manual/wget.html#Download-Options
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html