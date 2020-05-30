#!/bin/bash

# To tell it to only split the input on newlines, you need to do
# Fixes problem of file or foldername having space in it and made into a newline by default
# Reference: https://unix.stackexchange.com/questions/9496/looping-through-files-with-spaces-in-the-names (in answer #222)
# Reference: https://www.quora.com/Bash-shell-What-does-IFS-n-mean
IFS=$'\n'
# {cat filenames.txt | while read line}  # also works but opens a sub-process according to stackoverflow reference below
for line in $(cat /filenames/filenames.txt)
do
    if [[ -f $line ]];
    then
        echo "$line : That file exists"
    elif [[ -d $line ]];
    then
        echo "$line : That's a directory"
    else
        echo "$line : I don't know what that is"
    fi
done

# Reference:
#  Adapted from: https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
#  3rd question down #446
echo
echo

# While trying out things:
while read line
do 
    if [[ -f "$line" ]];
    then
        echo "$line : That file exists"
    elif [[ -d "$line" ]];
    then
        echo "$line : That's a directory"
    else 
        echo "$line : I dont know what that is"
    fi
done < ./filenames/filenames.txt

# Reference
# Adapted from: https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
# Question: 2086