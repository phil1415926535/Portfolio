#!/bin/bash

# Ask user to input how many numbers they want to calculate
echo -e "\e[33mThis is a simple calculator for TWO numbers\e[0m"

# Variables - operators
D1="+"
D2="-"
D3="*"
D4="/"

YELLOW="\033[33m"
BLUE="\033[34m"
GREEN="\033[32m"
RED="\033[31m"
PURPLE="\033[35m"
OFF="\033[0m"


echo -e "$YELLOW**************Enter Choice :**************$OFF"
echo -e "$BLUE********** 1. Addition        ************$OFF"
echo -e "$GREEN********** 2. Subtraction     ************$OFF"
echo -e "$RED********** 3. Multiplication  ************$OFF"
echo -e "$PURPLE********** 4. Division        ************$OFF"
echo -e "$YELLOW******************************************$OFF"

read -p "Choice: " F1



case $F1 in
    1)
        read -p "Please enter FIRST number: " C1
        echo -e "$BLUE'$C1 $D1 _'$OFF"
        read -p "Please enter SECOND number: " C2
        echo "$C1$D1$C2" | bc -l > calc.txt
        A1=$(cat calc.txt)
        echo
        echo -e "$BLUE********************************$OFF"
        echo -e "$BLUE     $C1 $D1 $C2 = $A1 $OFF"
        echo -e "$BLUE********************************$OFF"
        
    ;;
    2)
        read -p "Please enter FIRST number: " C1
        echo -e "$GREEN'$C1 $D2 _'$OFF"
        read -p "Please enter SECOND number: " C2
        echo "$C1$D2$C2" | bc -l > calc.txt
        A1=$(cat calc.txt)
        echo
        echo -e "$GREEN********************************$OFF"
        echo -e "$GREEN     $C1 $D2 $C2 = $A1 $OFF" 
        echo -e "$GREEN********************************$OFF"
    ;;
    3)
        read -p "Please enter FIRST number: " C1
        echo -e "$RED'$C1 $D3 _'$OFF"
        read -p "Please enter SECOND number: " C2
        echo "$C1$D3$C2" | bc -l > calc.txt
        A1=$(cat calc.txt)
        echo
        echo -e "$RED********************************$OFF"
        echo -e "$RED     $C1 $D3 $C2 = $A1 $OFF" 
        echo -e "$RED********************************$OFF"
    ;;
    4)
        read -p "Please enter FIRST number: " C1
        echo -e "$PURPLE'$C1 $D4 _'$OFF"
        read -p "Please enter SECOND number: " C2
        echo "$C1$D4$C2" | bc -l > calc.txt
        A1=$(cat calc.txt)
        echo
        echo -e "$PURPLE********************************$OFF"
        echo -e "$PURPLE     $C1 $D4 $C2 = $A1 $OFF"
        echo -e "$PURPLE********************************$OFF"

    
    ;;
    *)  echo "Does Not Compute, Danger Will Robinson! Danger!"
        echo -e "$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF"
        echo -e "$BLUE*O*$OFF $RED*V*$OFF $GREEN*E*$OFF $PURPLE*R*$OFF $YELLOW*L*$OFF $BLUE*O*$OFF $RED*A*$OFF $GREEN*D*$OFF"
        echo -e "$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF$GREEN*$OFF$PURPLE*$OFF$YELLOW*$OFF$BLUE*$OFF$RED*$OFF"
    ;;
    esac

    read -p "Try again? (y/n): " ag2
    if [[ "$ag2" == "y" ]];
        then 
        exec ./calculator.sh
    elif [[ "ag2" == "n" ]];
        then 
        exit 0
    else
        echo "Bye"
        exit 45
    fi

exit 0

