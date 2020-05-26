#! /bin/bash

./passwordCheck.sh
if [[ $? -ne 0 ]];
then 
    exit 1
fi

R1=
R2=
R3= 

echo "Select an Option"
echo "1. Create a folder"
echo "2. Copy a folder"
echo "3. Set a password"
read -p "" option

