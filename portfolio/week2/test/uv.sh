#!/bin/bash

# UV Index Reference
    # 0-2 Low 
    # 3-7 Moderate to High
    # 8+ Very High to Extreme

echo
read -p "Enter a UV index value from 0 to 11:  " UV
echo

# IF statement and else if - what to do with variable entered
if [[ "$UV" -le 2 ]];
    then
        echo "UV Level LOW : Minimal Protection Required."
        echo 1
        exit 
elif [[ "$UV" -ge "3" ]] && [[ "$UV" -le "7" ]];
    then
        echo "UV Level MODERATE: Standard protection required."
        echo 2
        exit
elif [[ "$UV" -ge "8" ]]  && [[ "$UV" -le "11" ]];
    then
        echo "UV Level EXTREME : Maximum Protection Required"
        echo 3
        exit
else
        echo "The number you have entered is outside of the UV index range of numbers"
fi

# Number outside range - ask user to continue or exit
echo "Try again with a number within range?" | cowsay -f dragon
read -p "y/n: " YN1
echo

# IF statement for user answer
if [[ "$YN1" == "y" ]]
    then
        ./uv.sh
else
    echo "Bye!"
    echo 4
    exit
fi