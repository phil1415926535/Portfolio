#! /bin/bash

# Asks for user input if they want to install cowsay
echo "Do you want to install cowsay and xcowsay to run the game? yes or no"
read answer

# If statement 
if [ $answer == "no" ]    
then
        exit
fi

# Installs the necessary cowsays
sudo apt install cowsay
sudo apt install xcowsay
echo

# Copies cowsay files to root to allow it to work there
sudo ln -s /usr/games/cowsay /usr/bin/cowsay
sudo ln -s /usr/games/cowthink /usr/bin/cowthink
sudo ln -s /usr/games/xcowsay /usr/bin/xcowsay
echo 

# Asks for user input if they want to play the game now
echo "Do you want to start the game now? yes or no"
read play

# If statement
if [ $play == "no" ]
then
    exit
fi

# Starts the game
./read.sh

code 0