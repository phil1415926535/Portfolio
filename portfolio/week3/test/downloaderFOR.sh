#!/bin/bash



for dl in $URL;
do
echo "Type URL to download or “exit” to quit :"
read -p "Address: " URL

    if [[ $dl == "exit" ]];
        then
            echo "Goodbye!"
            exit
    elif [[ $dl != "exit" ]];
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
    else
        wget -P $loc $R1
    fi

done

# References:
# https://www.gnu.org/software/wget/manual/wget.html#Download-Options
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html