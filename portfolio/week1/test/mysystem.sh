#!/bin/bash
clear
printf "This is information provided by mysystem.sh. Program starts now."

printf "Hello, $USER \n\n"

printf "Today's date is "date", this is week '$date +"%V"."

printf "these users are currently connected:"
w | cut -d " " -f 1 - | grep -v USER | sort -users
printf "\n"

printf "This is 'uname -s' running on a 'uname -m' processor.\n\n"

printf "This is the uptime information:"
uptime
printf "\n"

printf "Thats all folks"
