#! /bin/bash

# Asks user to enter password to check and sets password variable
echo "Please enter a password for verification"
read -s -p "Password: " password

# Creates file with new hash inside for comparison to original
# Will be comparing the hashes of the files not the hashes inside the files
# HASH of entered password goes into file
echo "$password" | sha256sum > /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw2.txt
cp /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw2.txt /home/phiggs/student/scripts/portfolio/week2/secretpw2.txt


# The file with the hashed password has its checksum copied to a file
# echo sha256sum /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt  /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt > /home/phiggs/student/scripts/portfolio/week2/secretpw/sha256.txt

# Checksum of file of password compared to checksum in sha256 (which is of the secretpw.txt file)
# echo -n "$(cat secretpw/sha256.txt)" | sha256sum --check secretpw/secretpw.txt

#https://superuser.com/questions/1312740/how-to-take-sha256sum-of-file-and-compare-to-check-in-one-line
#echo -n cat ./secretpw/sha256.txt | sha256sum -c  ./secretpw/secretpw2.txt
#echo "14bb4a88ca1378437689f64db055cd78488f4c01a103a3efc04bcbd639922b1b  ./secretpw/secretpw2.txt" | sha256sum --check
# echo -n "$(cat ./secretpw/sha2.txt)" | sha256sum -c

# https://stackoverflow.com/questions/51546097/verify-sha-256-sum-of-a-file-and-exit-the-script-if-not-as-intended
# IF statement if wrong password entered
if ! echo -n "$(cat ./secretpw/sha2.txt)" | sha256sum -c -; 
then
    echo
    echo "Access Denied" >&2
    echo
    exit 1
else
    echo
    echo "Access Granted"
    echo
fi
exit 0
