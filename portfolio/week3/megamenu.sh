#! /bin/bash

# Makes and presents a menu of options to run the other scripts made during the CYB6004 Scripting Languages unit.

# Variables
R1="./folderMaker.sh"
R2="./folderCopier.sh"
R3="./setPassword.sh"
R4="./calculator.sh"
R5="./megafoldermaker.sh"
R6="./filenames.sh"
R7="./downloader.sh"

E0="exit 0"
E1="exit 1"

YE="\033[93m"   # Yellow
RD="\033[91m"   # Red
BO="\033[1m"    # Bold
O="\033[0m"     # Off

# Runs passwordCheck to verify user password
# passwordCheck.sh runs setPassword.sh
# if exit message from passwordCheck.sh is not equal to 0 then exit, otherwise continue

./passwordCheck.sh
if [[ $? -ne 0 ]];
then 
    $E1
fi


while true;
do

# Link to menu display bash script
./menu_files/menu.sh
echo -e "$YE$BO"
read -p "Selection (eg: one or 1): " option
echo -e "$O"

# Case statement - adapted from "https://www.thegeekstuff.com/2010/07/bash-case-statement/"
# Options in Menu to choose
case $option in
    [1] | [oO][nN][eE] )
        echo "Making Folder ..."
        $R1
        echo "Done"
        ;;
    [2] | [tT][wW][oO] )
        echo "Copying Folder ..."
        $R2
        echo "Done"
        ;;
    [3] | [tT][hH][rR][eE][eE] )
        echo "Changing password ..."
        $R3
        echo "Done"
        ;;
    [4] | [fF][oO][uU][rR] )
        echo "Calculating ..."
        $R4
        ;;
    [5] | [fF][iI][vV][eE] )
        echo "Creating Week Folders ..."
        echo "Please enter 3 week numbers to make the folders"
        read -p "3 numbers (eg, 4 5 6 ): " num 

        #Passes the variables entered to the ./megafoldermaker.sh script
        $R5 $num
        ;;

    [6] | [sS][iI][xX] )
        echo "Checking Filenames  ..."
        $R6
        read -p "Press any key to go back to menu"
        ;;
    [7] | [sS][eE][vV][eE][nN] )
        echo "Downloading a file ..."
        $R7
        echo "Done"
        ;;
    [8] | [eE][iI][gG][hH][tT] | [eE][xX][iI][tT] )
        echo "Bye"
        echo
        $E0
        ;;
    *)  echo "Please enter a valid number option in alpha or numeric input"
        echo
        ;;
esac

echo "Back to menu"
sleep 1

done


# References
# 