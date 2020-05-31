#! /bin/bash
#! created by Philip Higgs (references for borrowed work noted)
#! have modified secretpw.sh file created earlier as this is now more adapted to work with menu.sh 

R1=$(cat pwdirlog.txt)

# VARIABLES
# Reference: "https://unix.stackexchange.com/questions/181423/how-to-assign-the-cat-output-of-a-bash-script-to-a-variable-in-another-script" $( cat pwdirlog.txt )
E0="exit 0"
E1="exit 1"

#Lets user know what to expect
echo "Do you want to change your password to a new one?"
echo "YES to continue, NO to go back to menu"
read -p "Yes or No: " yesorno

case $yesorno in
    [yY] | [yY][eE][sS] )
        # Continues to change password
        ;;
    [nN] | [nN][oO] )
        echo
        echo "No changes made"
        $E0
        ;;
    * )
        echo "Invalid Entry"
        echo "Bye"
        $E1
        ;;
esac

# Ask user to create a new password to overwrite the file created previously
echo "Please create a new secret password to save"
read -s -p "Password:  " password

# Save password in file overwriting previous file
echo "$password" | sha256sum > ./secretpw/secretpw.txt
echo
echo "Done"
echo


exit 0