#! /bin/bash
#! created by Philip Higgs (references for borrowed work noted)
R1="$USER"

#Lets user know what to expect
echo "This program makes a new folder with a name you specify"
echo "Do you want to view the directory tree to assist in making decision?"
read -p "y / n: " answer1

# if statement for user response
if [[ "$answer1" == "y" ]];
then 
    tree ~
fi

echo
echo "Enter the name of the folder you want to create, not the path"
read -p "Name of folder: " folderName
echo

echo "This will be created from your user directory, now enter path with initial / and end / "
read -p "Enter Directory Path: " folderPath
echo

# Reference: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
if [[ -d "/home/$R1$folderPath$folderName" ]]
then 
    echo "Directory /home/$R1$folderPath$folderName exists already"
    read -p "Do you want to continue? (y/n): " answer2
    if [[ "$answer2" == "n" ]]
    then 
        exit
    fi
else
    mkdir /home/$R1$folderPath$folderName # Makes the directory from the default user directory - see R1
    echo "FOLDER CREATED!"
    echo
fi

# Asks user to open folder in a terminal window
echo "Do you want to open the folder in terminal now? Answer: y / n"
read -p "Answer y/n: " answer4
echo

# if statement to respond to user input Answer
if [[ "$answer4" == "n" ]]
then
    exit
fi

#This command adapted from https://askubuntu.com/questions/75222/how-can-i-start-gnome-terminal-at-a-particular-directory
gnome-terminal --working-directory=/home/$R1$folderPath$folderName

exit 0