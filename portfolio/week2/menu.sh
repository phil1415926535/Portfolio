#! /bin/bash

###########################################################################################################################################################
# Step 1: menu.sh.                                                                                                                                        #
# Write a script called  'menu.sh'                                                                                                                        # 
# that starts by running the 'passwordCheck.sh' script from task 2.4.                                                                                     #
# If the exit code from passwordCheck.sh is 0, display the following text on the screen:                                                                  #
#                                                                                                                                                         #
# 1. Create a folder                                                                                                                                      #
# 2. Copy a folder                                                                                                                                        #
# 3. Set a password                                                                                                                                       #
#   Step 2: Test script.                                                                                                                                  #
# Execute and test this script, and make sure it only displays the menu text if the user gets the password right.                                         #
#   Step 3: Read and case statement.                                                                                                                      #
# Write a  'read' statement Read is a builtin command of the Bash shell. It reads a line of text from standard input and splits it into words.            #
#   These words can then be used as the input for other commands.                                                                                         #
#   to get the user’s choice, and a “case” statement.                                                                                                     #
#   Case statements are generally used to simplify complex conditionals when you have multiple different choices.                                         #
#   Using the case statement instead of nested if statements will help you make your Bash scripts more readable and easier to maintain.                   #
#   that will make decisions based on that choice.                                                                                                        #
#   Step 4: Case statement.                                                                                                                               #
# Use the “case” statement to run the three other scripts:                                                                                                #
#                                                                                                                                                         #
#     When the user selects 1, it should run folderCreator.sh.                                                                                            #
#     When the user selects 2, it should run folderCopier.sh.                                                                                             #
#     When the user selects 3, it should run setPassword.sh.                                                                                              #
###########################################################################################################################################################


R1="./folderMaker.sh"
R2="./folderCopier.sh"
R3="./setPassword.sh"

E0="exit 0"
E1="exit 1"

# Runs passwordCheck to verify user password
./passwordCheck.sh
if [[ $? -ne 0 ]];
then 
    $E1
fi

echo "     *********Menu*********"
echo "     * Select an Option   *"
echo "     * 1. Create a folder *"
echo "     * 2. Copy a folder   *"
echo "     * 3. Set a password  *"
echo "     * 4. Exit            *"
echo "     **********************"
echo

read -p "" option

# Case statement - adapted from "https://www.thegeekstuff.com/2010/07/bash-case-statement/"
case $option in
    [1] )
        echo "Making Folder ..."
        $R1
        echo "Done"
        ;;
    [2] )
        echo "Copying Folder ..."
        $R2
        echo "Done"
        ;;
    [3] )
        echo "Changing password ..."
        $R3
        echo "Done"
        ;;
    [4] )
        echo "Bye"
        echo
        $E0
        ;;
    *)  echo "Invalid Option"
        echo "Bye"
        echo
        $E1
        ;;
esac

echo 
read -p "Back to menu? (yes or no): " tryagain

# Case Statement for yes or no answer *) is any entry
# exec statement from "https://stackoverflow.com/questions/27626800/run-bash-script-from-another-script-and-exit-first-script-while-second-is-runnin"
case $tryagain in
    [yY] | [yY][eE][sS] )
        exec ./menu.sh
        ;;
    [nN] | [nN][oO] )
        echo
        echo "Bye"
        echo
        ;;
    *)  echo "Invalid option entered"
        echo "Bye"
        echo
        $E1     
        ;;
esac

$E0

# References
# 