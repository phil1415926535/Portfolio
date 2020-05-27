#!/bin/bash

# Variables
# Don't tell anyone!
secret="shhh"

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
    echo -e "You have unlocked the secret menu!"
    echo
        ;;
* )
    # People who get it wrong need to be told to go away!
    echo "Go Away!"
    echo
    exit 1
    ;;
esac

exit 0