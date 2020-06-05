#!/bin/bash

intro()
{
    echo "           This is a guessing game"
    echo "Guess the chosen number which is between 1 and 100"
}
   
getNumber()
{
    until [[ $1 -eq $2 ]];
    do
        read -p "Enter your guess: " $1
        
        errors

        if [[ $1 -gt $2 ]];
        then
            echo "Too High!"
        fi

        if [[ $1 -lt $2 ]];
        then
            echo "Too Low!"
        fi

    done
}

errors()
{
        if [[ $1 -lt $3 || $1 -gt $4 ]]
        then
            echo "ERROR: Input must be between 1 and 100"
        fi
}

outtro()
{
    echo "Correct! Good Guessing!"
    exit 0
}



intro
getNumber "Guess" 42 1 100
outtro


