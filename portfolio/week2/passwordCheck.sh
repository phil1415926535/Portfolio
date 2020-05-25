#! /bin/bash

# Asks user to enter password to check and sets password variable
echo "Please enter a password for verification"
read -s -p "Password: " password

# Creates file with new hash inside for comparison to original
# Will be comparing the hashes of the files not the hashes inside the files
# HASH of entered password goes into file
echo "$password" | sha256sum > /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw2.txt

# The file with the hashed password has its checksum copied to a file
# echo sha256sum /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt  /home/phiggs/student/scripts/portfolio/week2/secretpw/secretpw.txt > /home/phiggs/student/scripts/portfolio/week2/secretpw/sha256.txt

# Checksum of file of password compared to checksum in sha256 (which is of the secretpw.txt file)
# echo -n "$(cat secretpw/sha256.txt)" | sha256sum --check secretpw/secretpw.txt

#echo -n cat ./secretpw/sha256.txt | sha256sum -c  ./secretpw/secretpw2.txt
echo "$password" | sha256sum | sha256sum -c ./secretpw/secretpw2.txt 