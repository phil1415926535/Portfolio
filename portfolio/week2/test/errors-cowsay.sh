#!/bin/bash

# Variables
# Don't tell anyone!
secret="shhh"

echo "You need to install cowsay to view this properly, if you already have cowsay installed you can type 'n'"
read -p "Install cowsay?: y/n: " installation
if [[ $installation == "y" ]]
then
    sudo apt install cowsay
fi

echo
read -s -p "What is the secret code?: "

# If the user types in the correct secret, tell them they got it right!
if [[ "$secret" = "$REPLY" ]];
then
    echo
    echo
    echo "You got it right!"
    correct="true"
else     
    echo
    echo
    echo "You got it wrong :("
    correct="false"
fi

echo
case $correct in
true )
    #TODO: add a secret menu for people in the know.
    echo -e "You have unlocked the secret menu! \n You will still need your password as well" | cowsay
    echo
    exec ./menu.sh
    ;;
* )
    # People who get it wrong need to be told to go away by a dragon!
    echo "Go Away!" | cowsay -f dragon
    exit 1
    ;;
esac

exit 0