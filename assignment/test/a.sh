#!/bin/bash

# Set variables
loc="./data_files"
dl_loc_txt="https://cve.mitre.org/data/downloads/allitems.txt"
dl_loc_csv="https://cve.mitre.org/data/downloads/allitems.csv"
menu="./menu_files"

echo "Verifying if download location exists"
if [[ -d "$loc" ]];
then
    echo "Verification success, continuing... "
else
    echo "Not exists ... Making directory... "
    sleep 1
    mkdir $loc
    if [ $? == 0 ];
    then 
        echo "Location successfully created, continuing... "
    else
        echo "Problem creating directory, maybe try creating it manually and retry running program"
        read -p "Do you want to open a terminal to locate problem? " Answer
        case $Answer in
        [yY] | [yY][eE][sS] )
        gnome-terminal --working-directory=~
        ;;
        [nN] | [nN][oO] )
        exit 1
        ;;
        *) # default case
        exit 1
        ;;
        esac
    fi
fi
sleep 1
echo "Verification of up to date files and downloading if required"

# downloads text file of list of CVE items
# -S if file doesnt exist downloads initial version
# -N checks file version of existing file and checks for newer version and only downloads if newer version exists
echo -e "\033[32;100;1m"
wget -c -SN --output-file=$loc/log_txt.txt --show-progress --progress=bar -P $loc $dl_loc_txt
# downloads csv file full list of CVE items
wget -c -SN --output-file=$loc/log_csv.txt --show-progress --progress=bar -P $loc $dl_loc_csv
echo -e "\033[0m"
