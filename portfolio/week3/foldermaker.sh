#! /bin/bash
#! created by Philip Higgs (references for borrowed work noted)
R1="$USER"

#Lets user know what to expect
echo "Please enter the path and folder of the folder you would like to make"
echo "just enter the name of the folder now, not the path"
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