#!/bin/bash

# Ask user to input how many numbers they want to calculate
echo -e "\e[33mPlease enter to how many numbers you would like to calculate\e[0m"
read -p "Enter 2, 3, or 4: " howmany

D1="\033[34m+\033[0m"
D2="\033[32m-\033[0m"
D3="\033[32m*\033[0m"
D4="\033[35m/\033[0m"



# Case statement
case $howmany in
    2)
    read -p "Please enter FIRST number: " C1
    
echo -e "\033[33m**************Enter Choice :**************\033[0m"
echo -e "\033[34m**********1. Addition         ************\033[0m"
echo -e "\033[32m**********2. Subtraction      ************\033[0m"
echo -e "\033[31m**********3. Multiplication   ************\033[0m"
echo -e "\033[35m**********4. Division         ************\033[0m"
echo -e "\033[33m******************************************\033[0m"

    read -p "Choice: " F1
    
    case $F1 in
    1)
    echo -e "\033[33m$C1\033[0m $D1"
    D5="\033[33m$C1\033[0m $D4 "
    ;;
    2)
    echo -e "\033[33m$C1\033[0m $D2"
    D5="\033[33m$C1\033[0m $D4 "
    ;;
    3)
    echo -e "\033[33m$C1\033[0m $D3"
    D5="\033[33m$C1\033[0m $D4 "
    ;;
    4)
    echo -e "\033[33m$C1\033[0m $D4"
    D5="\033[33m$C1\033[0m $D4 "
    ;;
    *)  echo "Does Not Compute, Danger Will Robinson! Danger!"
        exit 45
    ;;
    esac

    read -p "Please enter SECOND number: " C2
    
    echo -e "$D5$C2" 
    ;;
    
    3)
    read -p "Please enter FIRST number: " C3
    
    echo $C3 > calc.txt
    
    read -p "Function ( + - * / ): " F2
    
    if [[ "$F2" -ne "+" ]] || [[ "$F2" -ne "-" ]] || [[ "$F2" -ne "*" ]] || [[ "$F2" -ne "/" ]];
        then 
            echo "invalid entry: "
            read -p "Start again? (y/n): " ag2
                if [[ "$ag2" == "y" ]];
                then 
                    exec ./calc.sh
                else
                    echo "Bye"
                    exit 45 
                fi
        
    fi

    echo $F2 >> calc.txt
    
    read -p "Please enter SECOND number: " C4
    
    echo $C4 >> calc.txt
    
    read -p "Function ( + - * / ): " F3

    if [[ "$F3" -ne "+" ]] || [[ "$F3" -ne "-" ]] || [[ "$F3" -ne "*" ]] || [[ "$F3" -ne "/" ]];
        then 
            echo "invalid entry: "
            read -p "Start again? (y/n): " ag2
                if [[ "$ag2" == "y" ]];
                then 
                    exec ./calc.sh
                else
                    echo "Bye"
                    exit 45 
                fi
        
    fi
    
    echo $F3 >> calc.txt
    
    read -p "Please enter SECOND number: " C5
    
    echo $C5 >> calc.txt
    ;;
    4)
    read -p "Please enter FIRST number: " C6
    
    echo $C6 > calc.txt
    
    read -p "Function ( + - * / ): " F4
    
    if [[ "$F4" -ne "+" ]] || [[ "$F4" -ne "-" ]] || [[ "$F4" -ne "*" ]] || [[ "$F4" -ne "/" ]];
        then 
            echo "invalid entry: "
            read -p "Start again? (y/n): " ag2
                if [[ "$ag2" == "y" ]];
                then 
                    exec ./calc.sh
                else
                    echo "Bye"
                    exit 45 
                fi
        
    fi

    echo $F4 >> calc.txt
    
    read -p "Please enter SECOND number: " C7
    
    echo $C7 >> calc.txt
    
    read -p "Function ( + - * / ): " F5

    if [[ "$F5" -ne "+" ]] || [[ "$F5" -ne "-" ]] || [[ "$F5" -ne "*" ]] || [[ "$F5" -ne "/" ]];
        then 
            echo "invalid entry: "
            read -p "Start again? (y/n): " ag2
                if [[ "$ag2" == "y" ]];
                then 
                    exec ./calc.sh
                else
                    echo "Bye"
                    exit 45 
                fi
        
    fi
    
    echo $F5 >> calc.txt
    
    read -p "Please enter SECOND number: " C8
    
    echo $C8 >> calc.txt
    
    read -p "Function ( + - * / ): " F6

    if [[ "$F6" -ne "+" ]] || [[ "$F6" -ne "-" ]] || [[ "$F6" -ne "*" ]] || [[ "$F6" -ne "/" ]];
        then 
            echo "invalid entry: "
            read -p "Start again? (y/n): " ag2
                if [[ "$ag2" == "y" ]];
                then 
                    exec ./calc.sh
                else
                    echo "Bye"
                    exit 45 
                fi
        
    fi
    
    echo $F6 >> calc.txt
    
    read -p "Please enter SECOND number: " C9
    
    echo $C9 >> calc.txt
    ;;
    * )  echo "Does not compute"

    echo
    echo
        read -p "Try again? (y/n): " ag2
        if [[ "$ag2" == "y" ]];
            then 
            exec ./calc.sh
        elif [[ "ag2" == "n" ]];
            then 
            exit 45
        else
            echo "Bye"
            exit 45 
        fi
    ;;
esac
