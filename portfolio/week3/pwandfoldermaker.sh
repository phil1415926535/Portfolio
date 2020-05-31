#! /bin/bash
#! created by Philip Higgs (references for borrowed work noted)
R1="$USER"

#Lets user know what to expect
echo "This program makes a folder, then takes your password you enter and stores the hash in a file"
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

# Ask for name of file to create
echo "What do you want to name the file - usual format is with *.txt extension"
read -p "File Name: " fileName

# Ask user to Create a secret password and save it in a file in the created folder 
echo "Now create a secret password to save in created folder"
read -s -p "Password:  " password

# Save password in file and makes a log of the directory path and file name
echo "$password" | sha256sum > /home/$R1$folderPath$folderName/$fileName

echo "Do you want to log this"
echo "Note: may affect usability of other programs"
read -p "y/n: " answer3

if [[ $answer3 == "y" ]];
then
    echo /home/$R1$folderPath$folderName/$fileName > /home/$R1$folderPath/pwdirlog.txt
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