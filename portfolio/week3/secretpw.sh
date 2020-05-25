#! /bin/bash
#! created by Philip Higgs (references for borrowed work noted)
R1="$USER"

#Lets user know what to expect
echo "This program makes a folder, then takes your password you enter and stores it in a file"
echo "Enter the name of the folder you want to create, not the path"
echo "After entering this the directory tree will display so you can identify path"
echo
read name
echo

#Displays directory tree
tree ~

echo
echo "This will be created from your user directory, now enter path with initial / and end / "
echo
read path
echo

# Makes the directory from the default user directory - see R1
mkdir /home/$R1$path$name

echo "FOLDER CREATED! Is this correct? /home/$R1$path$name ???"
echo "--> type: y (continue) / n (delete folder and exit)"
echo
read yorn
echo

# if statement for user question response
if [[ "$yorn" == "n" ]]
then
    rmdir /home/$R1$path$name && exit
fi

# Ask user to Create a secret password and save it in a file in the created folder 
echo "Please create a secret password to save in created folder"
read -s -p "Password:  " password

# Save password in file
echo "$password" | sha256sum >> /home/$R1$path$name/secretpw.txt

# Asks user to open folder in a terminal window
echo "Do you want to open the folder in terminal now? Answer: y / n"
echo
read Answer
echo

# if statement to respond to user input Answer
if [[ "$Answer" == "n" ]]
then
    exit
fi

#This command adapted from https://askubuntu.com/questions/75222/how-can-i-start-gnome-terminal-at-a-particular-directory
gnome-terminal --working-directory=/home/$R1$path$name

echo 0 