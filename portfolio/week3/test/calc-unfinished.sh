#!/bin/bash

# Ask user to input how many numbers they want to calculate
echo -e "\e[33mThis is a simple calculator for TWO numbers\e[0m"

D1="\033[34m+\033[0m"
D2="\033[32m-\033[0m"
D3="\033[32m*\033[0m"
D4="\033[35m/\033[0m"

N1="\033[33m$C1\033[0m"
N2="\033[33m$C2\033[0m"

echo -e "\033[33m**************Enter Choice :**************\033[0m"
echo -e "\033[34m********** 1. Addition        ************\033[0m"
echo -e "\033[32m********** 2. Subtraction     ************\033[0m"
echo -e "\033[31m********** 3. Multiplication  ************\033[0m"
echo -e "\033[35m********** 4. Division        ************\033[0m"
echo -e "\033[33m******************************************\033[0m"

read -p "Choice: " F1

read -p "Please enter FIRST number: " C1

    case $F1 in
    1)
    echo -e "$N1 $D1"
    R1="$N1 $D1 "
    ;;
    2)
    echo -e "$N1 $D2"
    R1="$N1 $D2 "
    ;;
    3)
    echo -e "$N1 $D3"
    R1="$N1 $D3 "
    ;;
    4)
    echo -e "$N1 $D4"
    R1="$N1 $D4 "
    ;;
    *)  echo "Does Not Compute, Danger Will Robinson! Danger!"
        echo "Overload"
        echo "********"
        exit 45
    ;;
    esac

    read -p "Please enter SECOND number: " C2
    
    echo -e "$R1$C2" 
   

