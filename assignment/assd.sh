#!/bin/bash

# Set variables
loc="./data_files"
dl_loc_html="https://cve.mitre.org/data/downloads/allitems.html"
menu="./script_files/menu.sh"
mkstrs="./script_files/makestars.sh"

## FG Colours
red="\033[31m" # text red
grn="\033[32m" # text green
ylw="\033[33m" # text yellow
dfc="\033[39m" # default text colour

## BG Colors
dkgry="\033[100m" # dark grey background
dfbkg="\033[49m" # default background colour

bold="\033[1m" # bold text
offb="\033[21m" # turn off bold
dim="\033[2m" # dim the text
blink="\033[5m"
offbl="\033[25m"
off="\033[0m" # reset all attributes

slp="sleep 0.05"
slp1="sleep 0.1"
slp1s="sleep 1"
slp2s="sleep 2"
slp3s="sleep 3"

blank="printf "%s\n" " ""

dateh=$(date +%H)
datem=$(date +%M)


# FUNCTIONS
menu()
{
    echo
    echo -e "$dkgry$ylw$bold***************************** $red!!! OPTIONS !!!$dfc $ylw*******************************"
    $slp
    echo -e "$dkgry$ylw$bold***************************** $red!!!  $dateh$blink:$offbl$datem  !!!$dfc $ylw*******************************"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****$grn 1. Initial download or update to latest complete CVE list         $ylw*****"
    $slp
    echo -e "*****$grn 2. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp    
    echo -e "*****$grn 3. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 4. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 4. ***AnOtHeR_oPtIoN***                                           $ylw*****"    
    $slp
    echo -e "*****$grn 6. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 7. Delete all working files                                       $ylw*****"
    $slp
    echo -e "*****$grn 8. Exit program                                                   $ylw*****"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****************************************************************************"
    echo -e "$off"
}

option_one()
{
    if [[ $1 == 1 || $1 = "one" ]];
    then
    echo "Verifying if download location exists"
        if [[ -d "$loc" ]];
        then
            echo "Directory verification success, continuing... "
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
    # downloads csv file full list of CVE items
    echo -e "\033[32;100;1m"
    wget -c -SN --output-file=$loc/log_html.txt --show-progress --progress=bar -P $loc $dl_loc_html
    echo -e "DONE!"
    echo -e "$off"
fi
return 0
}

option_seven ()
{
    echo "This will delete the downloaded file and the search file"
    read -p "Are you sure:(y/n) " yn
    if [[ $yn = "y" ]]; then
        delwf
        $mkstrs 77 0.005
        $slps1
        echo "Done!"
        $slps1
    else
        echo "Nothing Done"
        $slps1
    fi
}

option_eight ()
{
    echo "Goodbye"
    echo
    exit 0  
}

delwf ()
{
rm -f ../data_files/allitems.html
rm -f ../data_files/file.txt
}

# PROGRAM STARTS HERE

clear
echo -e $bold$ylw
$mkstrs 80 0
echo
printf "%s\n"  "This script can download the full list of CVE Vulnerabilities from the website:" "https://cve.mitre.org/data/downloads/" "Note that the download size is ~150MB" "At least a further 150MB will be needed in the same directory for a working file"
echo
$mkstrs 80 0.01
echo
echo -e $dim$grn
read -p "Any key to continue..."
echo -e $off



# while loop to loop menu, script runs its operations in here
while true;
do

clear
$slp1
menu

echo -e "$bold$grn"
read -p "Choose an option: " choice
echo
echo -e "Implementing option number $choice"
    
$mkstrs 77 0.005
echo -e "$off"

case $choice in
    [1] | [oO][nN][eE])
    option_one $choice
    ;;
    [2] | [tT][wW][oO])
    # function goes here    
    ;;
    [3] | [tT][hH][rR][eE][eE])
    # function goes here    
    ;;
    [4] | [fF][oO][uU][rR])
    # function goes here    
    ;;
    [5] | [fF][iI][vV][eE])
    # function goes here    
    ;;
    [6] | [sS][iI][xX])
    # function goes here    
    ;;
    [7]|[sS][eE][vV][eE][nN])
    echo "This will delete the downloaded file and the search file"
    read -p "Are you sure:(y/n) " yn
    if [[ $yn = "y" ]]; then
        rm ../data_files/allitems.html
        $mkstrs 77 0.005
        echo
        echo "Done!"
        $slps1
    else
        echo "Nothing Done"
        $slps1
    fi
    ;;
    [8]|[eE][iI][gG][hH][tT])
    option_eight
    ;;
    *) 
    echo -e $red$bold
    printf "%s\n" "***ERROR:" "$choice" "Does not compute..." "Please try again!" " " "Example for option 5: enter numerical: 5 or text: five"
    echo -e $offb
    echo -e "\033[7m"
    read -p "Press ENTER to continue"
    ;;
esac



done