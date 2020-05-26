#!/bin/bash
#  Asks the user to type in a password.
#  The password must match certain criteria, such as:
#  password length: greater than or equal to 8 characters
#  grep is searching for certain characters in the password, so the password has to match the characters grep is specifically searching for
#  eg, 0-9, A-Z, a-z, and specific special characters: $,@,#,%
#  If the password doesn't match all of these criteria
#  then it echo's a phrase to the user to correct the specific area in password

 echo "enter the password"
 read password
 len="${#password}"
 if test $len -ge 8 ; then
     echo "$password" | grep -q [0-9]
     if test $? -eq 0 ; then
     echo "$password" | grep -q [A-Z]
     if test $? -eq 0 ; then
     echo "$password" | grep -q [a-z]
     if test $? -eq 0 ; then 
     echo "$password" | grep -q [$,@,#,%]
     if test $? -eq 0 ; then
     echo "Strong password"
         else
         echo "weak password include special chars"
         fi 
     else
     echo "weak password include lower case char"
     fi
     else
     echo "weak password include capital char" 
     fi
     else
     echo "please include the numbers in password it is weak password" 
     fi
 else
 echo "password length should be greater than or equal 8 hence weak password"
 fi
 
# To make it password more secure:
# hide user input from screen output
# hash password and store it in file
# add salt to password before hashing and storing
# store password in secure encrypted location
