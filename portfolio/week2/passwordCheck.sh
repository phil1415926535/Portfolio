#! /bin/bash

# Asks user to enter password to check and sets password variable
echo "Please enter a password for verification"
read -s -p "Password: " password
echo

# Creates file with new hash inside for comparison to original
# Will be comparing the hashes of the files not the hashes inside the files
# HASH of entered password goes into file
echo "$password" | sha256sum > ~/student/scripts/portfolio/week2/secretpw/secretpw2.txt

# Creates hash of the file containing the hash of the password
sha256sum ./secretpw/secretpw2.txt > ./secretpw/sha2.txt

# Copies contents to new file removing the file and path from text
# https://stackoverflow.com/questions/1795678/append-date-to-filename-in-linux ( " " is the delimiter in this case)
cat ./secretpw/sha2.txt | cut -d " " -f 1 > ./secretpw/sha3.txt

# The file with the hashed password has its checksum copied to a file
# echo sha256sum /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt  /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt > /home/phiggs/student/scripts/portfolio/week2/secretpw/sha256.txt

# Checksum of file of password compared to checksum in sha256 (which is of the secretpw.txt file)
# echo -n "$(cat secretpw/sha256.txt)" | sha256sum --check secretpw/secretpw.txt

# https://superuser.com/questions/1312740/how-to-take-sha256sum-of-file-and-compare-to-check-in-one-line
# tried the following with varying amounts of success
# echo -n cat ./secretpw/sha256.txt | sha256sum -c  ./secretpw/secretpw2.txt
# echo "14bb4a88ca1378437689f64db055cd78488f4c01a103a3efc04bcbd639922b1b  ./secretpw/secretpw2.txt" | sha256sum --check
# echo -n "$(cat ./secretpw/sha2.txt)" | sha256sum -c
# Great difficulty in getting this working until realised the <hash> <file> | sha256sum -c and that the <file> needs to be linked to the file and path as per the hash value line
# and needed to add the line above, ie, "cat ./secretpw/sha2.txt | cut -d " " -f 1 > ./secretpw/sha3.txt"

# SHA256SUM IF STATEMENT reference: https://stackoverflow.com/questions/51546097/verify-sha-256-sum-of-a-file-and-exit-the-script-if-not-as-intended
# IF statement if wrong password entered - also adds in file identifier of original file with password in
if ! echo -n "$(cat ./secretpw/sha3.txt) ./secretpw/secretpw.txt" | sha256sum -c --status -; 
then
    echo
    echo "Access Denied" >&1
    echo
    exit 1
else
    echo
    echo "Access Granted" >&1
    echo
    exit 0
fi