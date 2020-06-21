#!/bin/bash

# Assignment by Philip Higgs

# Set Global variables
loc="./data_files"
dl_loc_html="https://cve.mitre.org/data/downloads/allitems.html"
mkstrs="./script_files/makestars.sh" # Makes another file and can handle input of different variable eg: 88 0.05 (88 stars, 0.05 seconds each)

## FG Colours
red="\033[31m" # text red
grn="\033[32m" # text green
ylw="\033[33m" # text yellow
dfc="\033[39m" # default text colour

## BG Colors
dkgry="\033[100m" # dark grey background
dfbkg="\033[49m" # default background colour

bold="\033[1m" # bold text
offb="\033[21m" # turn off bold
dim="\033[2m" # dim the text
blink="\033[5m" #on blink
offbl="\033[25m" #off blink
off="\033[0m" # reset all attributes

slp="sleep 0.05"
slp01"sleep 0.1"
slp05="sleep 0.5"
slp1s="sleep 1"
slp2s="sleep 2"
slp3s="sleep 3"

# Date Variables for Menu
dateh=$(date +%H)
datem=$(date +%M)

# Option 2 Variables
thisdate=$(awk '(/Created Date:/) { print $3 }' $loc/CVEfile.txt) # to check the date the created/converted text file was created

# FUNCTIONS
# List functions first to call upon later when required
# The scripts consists of a case statement with functions for each option
intro_func()
{
    echo -e $bold$ylw
    $mkstrs 93 0
    echo
    printf "%s\n"  "*** This script can download the full list of CVE Vulnerabilities from the website:       ***" "*** https://cve.mitre.org/data/downloads/                                                 ***" "*** Please ensure you have at least 500MB of space to run all the features of this script ***"
    $mkstrs 93 0.01
    echo
    echo -e $dim$grn
    read -p "Press ENTER key to continue..."
    echo -e $off
}

menu()
{
    echo
    echo -e "$dkgry$ylw$bold***************************** $red!!! OPTIONS !!!$dfc $ylw*******************************"
    $slp
    echo -e "$dkgry$ylw$bold***************************** $red!!!  $dateh$blink:$offbl$datem  !!!$dfc $ylw*******************************"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****$grn 1. Initial download or update to latest complete CVE list         $ylw*****"
    $slp
    echo -e "*****$grn 2. Convert downloaded html file into text file                    $ylw*****"
    $slp    
    echo -e "*****$grn 3. Create CVEfile.CSV from full CVEfile.txt                       $ylw*****"
    $slp
    echo -e "*****$grn 4. Number of CVE's per year                                       $ylw*****"
    $slp
    echo -e "*****$grn 5. Compare CVE Name to Assignment Date for a search term          $ylw*****"    
    $slp
    echo -e "*****$grn 6. Compare how many CVE's per year for a search term              $ylw*****"
    $slp
    echo -e "*****$grn 7. Delete downloaded / created files                              $ylw*****"
    $slp
    echo -e "*****$grn 8. Exit program                                                   $ylw*****"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****************************************************************************"
    echo -e "$off"
}

option_one()
{
# if statement for variables passed to this function - not required but showing it could be done. Could remove the if statement if required.
    if [[ $1 == 1 || $1 = "one" ]];
    then
    echo "Verifying if download location exists"
        if [[ -d "$loc" ]];
        then
            echo "Directory verification success, continuing... "
        else
            echo "Not exists ... Making directory... "
            sleep 1
            mkdir $loc
            if [ $? == 0 ];
            then 
                echo "Location successfully created, continuing... "
            else
                echo "Problem creating directory, maybe try creating it manually and retry running program, or delete existing files (option 7) and try again"
                read -p "Do you want to open a terminal to locate problem? " Answer
                case $Answer in
                [yY] | [yY][eE][sS] )
                gnome-terminal --working-directory=~
                ;;
                [nN] | [nN][oO] )
                exit 1
                ;;
                *) # default case
                exit 1
                ;;
                esac
            fi
        fi
        sleep 1

    echo "Verification of up to date files and downloading if required"

    # -S if file doesnt exist downloads initial version
    # -N checks file version of existing file and checks for newer version and only downloads if newer version exists
    # downloads html file full list of CVE items
    echo -e "\033[32;100;1m"
    wget -c -SN --output-file=$loc/log_html.txt --show-progress --progress=bar -P $loc $dl_loc_html
    echo -e "DONE!"
    echo -e "$off"
    read -p "Press ENTER to continue back to menu"
fi
return 0
}

option_two()
{
    if [[ ! -f $loc/CVEfile.txt ]];
    then
        printf "%s\n" "This will only work if option 1 has been previously run successfully and allitems.html downloaded" "The downloaded allitems html file is now having its formatting removed and being converted into a text file" "Please be patient as this may take a minute or two"
        sed -e 's/<[^>]*>//g' $loc/allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Created Date: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================\nEND/" | sed 's/(&lt\;br&gt\;|&gt|&amp\;|\,)//g' > $loc/CVEfile.txt
        #sed -e 's/<[^>]*>//g' $loc/allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Created Date: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================\nEND/" | sed 's/&lt\;br&gt\;//g' | sed 's/&gt//g' | sed "s/&amp\;/ /g" | sed 's/\,//g' > $loc/CVEfile.txt
    
    else 
        echo "This file exists already, and was converted on $thisdate"
        read -p "Are you sure you want to over-write (y/n): " owtxt
        if [[ $owtxt == y ]];
        then
            printf "%s\n" 'The downloaded allitems html file is now having its formatting removed and being converted into a text file' 'Please be patient as this may take a minute or two'
            sed -e 's/<[^>]*>//g' $loc/allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Created Date: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================\nEND/" | sed 's/(&lt\;br&gt\;|&gt|&amp\;|\,)//g' > $loc/CVEfile.txt
            #sed -e 's/<[^>]*>//g' $loc/allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Created Date: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================\nEND/" | sed 's/&lt\;br&gt\;//g' | sed 's/&gt//g' | sed "s/&amp\;/ /g" | sed 's/\,//g' > $loc/CVEfile.txt    
        fi
    fi

echo -e "Done! Back to menu"
$slp1s
}


option_three()
{
    echo -e "A CSV file CVEfile.csv will be created from text file CVEfile.txt"
    echo -e "Note: This process converts previously created CVEfile.txt to CVEfile.csv"
    read -p "Press enter to continue or type exit: " csvcreate
    
    if [[ $csvcreate != exit ]]; 
    then
        # Reference for below line -- sed ':a $!N;s/\ndesc/ desc/;ta P;D' "https://stackoverflow.com/questions/17021770/move-line-which-matches-pattern-to-previous-line", first answer after question \
        # appends text which adds the next line of input into the pattern and replaces the names eg: Description etc with a comma, P for printing up to the newline and D for deleting.
        # Reference also https://www.gnu.org/software/sed/manual/sed.html for learning.
        # This line takes the Reference and replaces with a | and "moves the following patterns up a line" | "and moves the | lines up | the first matching "|" is replaced with a comma | then remove leading Name: from each line and as per CSV files have added Columns Headings to the top of the line - replacing first line with that and \n newline to push other lines down
        sed 's/Reference:/ \| /' $loc/CVEfile.txt | sed -Ee ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D' | sed -Ee '/./s/ \| /,/' | grep -E "Name:" | sed 's/Name: //' | sed '1s/^/\"Name\",\"Description\",\"Phase\",\"Status\",\"Reference\"\n/' > $loc/CVEfile.csv

        echo -e "$grn Done! File CVEfile.csv can be located in the $loc directory $off"
        read -p "Press ENTER to go back to the main menu"
    fi
}


option_four()
{
 # while loop so can exit if user types exit - using the break command
    while true; do

    printf "%s\n" "This will only run if CVEfile.txt exists (option 2 needs to be run previously)" "This will print the number per year of CVE listed in the documentation" "Valid years are from 1999 to Current year" "Type each year with a single space between each - eg: 1999 2010"
    read -p ": " cveyears
    
    if [[ $cveyears == exit ]]; 
    then 
        break # break command to exit while loop
    fi

    rm -f $loc/CVEyears.txt
            
    for i in $cveyears
    do
        # uses the variables entered by the user to search for start of line and pipes the count "-c" to next command which then puts \
        # the year number in front of/replace the front of the line with the year and prints these to file in csv format
        grep -cE "^Name: CVE-$i" $loc/CVEfile.txt | sed "s/^/$i,/" >> $loc/CVEyears.txt
    done
    
    echo
    echo
    # Displays data in CVEyears into awk table
    echo -e $grn$bold"The Number of CVE's reported for years $cveyears: $off"
    awk 'BEGIN {
        FS=",";
        print "@@@@@@@@@@@@@@@@@@@@@@@@@@";
        print "@@@        |           @@@";
        print "@@@ \033[31;1mYear\033[0m   | \033[31;1m# of CVEs\033[0m @@@";
        print "@@@________|___________@@@";
    }
    {
        printf("@@@ \033[33m%-6s\033[0m | \033[35m%-9s\033[0m @@@\n", $1, $2);
    }
    END {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }' $loc/CVEyears.txt

    echo 
    echo

    read -p "Save this data to CSV file?(y/n): " other
    if [[ $other == y ]];
    then
        read -p "Enter Directory Location to save the file: " dirloc
        if [[ -d "$dirloc" ]];
            then
                echo "Directory verification success, continuing... "
            else
                echo "Not exists ... Making directory... "
                mkdir $dirloc
                if [ $? == 0 ];
                then 
                    echo "Location successfully created, continuing... "
                else
                    echo "Problem creating directory, maybe try creating it manually and retry running program, or delete existing files (option 7) and try again"
                    read -p "Do you want to open a terminal to locate problem? " Answer
                    case $Answer in
                    [yY] | [yY][eE][sS] )
                    gnome-terminal --working-directory=~
                    ;;
                    [nN] | [nN][oO] )
                    exit 1
                    ;;
                    *) # default case
                    exit 1
                    ;;
                    esac
                fi
        fi
        sed -i "1s/^/\"Name\",\"Year\"\n/" $loc/CVEyears.txt # Puts column descriptors at top of csv file
        cp $loc/CVEyears.txt $dirloc/CVEyears.csv
        echo -e "$grn File saved to $dirloc $off"
        read -p "Press ENTER to go back to main menu"
        $slp1s
        break
    else
        break
    fi
    done
}

option_five()
{
    rm -f $loc/assigned.txt
    echo -e "This option will allow you to type in a search term and output the CVE year and the Assigned year, for comparison"
    echo -e "The CVE number contains the year and the case number that it was submitted"
    echo -e "The date it is assigned may be a variable date"
    echo -e "This operation uses the CVEfile.csv file"
    read -p "Enter search term: " searchterm
    
    # Search lines for search term entered by user AND the the Assigned value to get the date it was assigned 
    # Uses previously referenced line
    grep -iE "[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv | grep -oE "(CVE-[[:digit:]]*-[[:digit:]]*,|Assigned \([0-9]{8}\))" | sed -Ee ':a $!N;s/\n(Assigned )//;ta P;D'| sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})/\1--\3\/\2/' | sed -E 's/[()]//g' > $loc/assigned.txt
    echo "Done"
    sleep 1

    echo -e "Table for search term $grn$bold \033[33m $searchterm \033[0m   $off"
    awk 'BEGIN {
        FS=",";
        print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
        print "@@@                   |  \033[31;1mDate Assigned\033[0m       @@@";
        print "@@@ \033[31;1m CVE Number\033[0m       | \033[31m(Year--Day/Month)\033[0m    @@@";
        print "@@@___________________|______________________@@@";
    }
    {
        printf("@@@ \033[33m%-17s\033[0m | \033[35m%-20s\033[0m @@@\n", $1, $2);
    }
    END {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }' $loc/assigned.txt

    read -p "Save this data to CSV file?(y/n): " other
    if [[ $other == y ]];
    then
        read -p "Enter Directory Location to save the file: " dirloc
        if [[ -d "$dirloc" ]];
        then
            echo "Directory verification success, continuing... "
        else
            echo "Not exists ... Making directory... "
            mkdir $dirloc
            if [ $? == 0 ];
            then 
                echo "Location successfully created, continuing... "
            else
                echo "Problem creating directory, maybe try creating it manually and retry running program, or delete existing files (option 7) and try again"
                read -p "Do you want to open a terminal to locate problem? " Answer
                # Probably no practical use for this, but MAY possibly find useful
                case $Answer in
                [yY] | [yY][eE][sS] )
                gnome-terminal --working-directory=~
                ;;
                [nN] | [nN][oO] )
                exit 1
                ;;
                *) # default case
                exit 1
                ;;
                esac
            fi
        fi
        sed -i "1s/^/\"CVE Name\",\"Date Assigned\"\n/" $loc/assigned.txt # Insertion of CSV style headings at start of file
        cp $loc/assigned.txt $dirloc/assigned.csv
        echo -e "$grn File $ylw assigned.csv $off saved to $dirloc $off"
        read -p "Press ENTER to continue..."
    fi

    read -p "Would you like to output the complete CVE Name details of the above search to a CSV file?" complete
    if [[ $complete == y ]];
    then
        read -p "Enter Directory Location to save the file: " dirloc2
        if [[ -d "$dirloc2" ]];
        then
            echo "Directory verification success, continuing... "
        else
            echo "Not exists ... Making directory... "
            mkdir $dirloc2
            if [ $? == 0 ];
            then 
                echo "Location successfully created, continuing... "
            else
                echo "Problem creating directory, maybe try creating it manually and retry running program, or delete existing files (option 7) and try again"
                read -p "Do you want to open a terminal to locate problem? " Answer2
                case $Answer2 in
                [yY] | [yY][eE][sS] )
                gnome-terminal --working-directory=~
                ;;
                [nN] | [nN][oO] )
                exit 1
                ;;
                *) # default case
                exit 1
                ;;
                esac
            fi
        fi
        grep -iE "[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv | sed '1s/^/\"Name\",\"Description\",\"Phase\",\"Status\",\"Reference\"\n/' > $dirloc2/assignedComplete.csv
        echo -e "$grn File $ylw assignedComplete.csv $off saved to $dirloc2 $off"
        read -p "Press ENTER to go back to main menu"
        $slp1s
    fi

}



option_six()
{

rm -f $loc/csvsearchyears.txt
touch $loc/csvsearchyears.txt

echo -e "This option will tell you how many CVE Names a search term is in per year"
echo -e "The search will include all years from 1999 - 2020"
# read -a array  -- was going to use this array from user input but decided to have preentered array
array=(1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020)
echo ${array[@]} # display to user what is being done, could be removed if needed

read -p "Enter a company or type of vulnerability or other term to search for: " searchterm

$slp05
for i in ${array[@]}; do
    # Making file in much the same was as before but using an array and a for loop
    grep -iE "^CVE-$i.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv | grep -cE "^CVE-$i" | sed "s/^/$i,/" >> $loc/csvsearchyears.txt
done

 
    echo
    echo
    # awk table format for display of data to user
    echo -e $grn$bold"The Number of times \033[33m $searchterm \033[0m reported for years ${array[@]} : $off"
    awk 'BEGIN {
        FS=",";
        print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
        print "@@@        |                 @@@";
        print "@@@ \033[31;1mYear\033[0m   | \033[31;1m# of occurences\033[0m @@@";
        print "@@@________|_________________@@@";
    }
    {
        printf("@@@ \033[33m%-6s\033[0m | \033[35m%-15s\033[0m @@@\n", $1, $2);
    }
    END {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }' $loc/csvsearchyears.txt


    read -p "Would you like to output the complete CVE Name details of the above search to a CSV file?" complete
    if [[ $complete == y ]];
    then
        read -p "Enter Directory Location to save the file: " dirloc
        if [[ -d "$dirloc" ]];
        then
            echo "Directory verification success, continuing... "
        else
            echo "Not exists ... Making directory... "
            mkdir $dirloc
            if [ $? == 0 ];
            then 
                echo "Location successfully created, continuing... "
            else
                echo "Problem creating directory, maybe try creating it manually and retry running program, or delete existing files (option 7) and try again"
                read -p "Do you want to open a terminal to locate problem? " Answer3
                case $Answer3 in
                [yY] | [yY][eE][sS] )
                gnome-terminal --working-directory=~
                ;;
                [nN] | [nN][oO] )
                exit 1
                ;;
                *) # default case
                exit 1
                ;;
                esac
            fi
        fi
    sed -i "1s/^/For Search Term $searchterm:, \n\"Year\",\"Number of Occurrences\"\n/" $loc/csvsearchyears.txt # Adding in CSV column headers
    cp $loc/csvsearchyears.txt $dirloc/csvsearchyears.csv
    echo -e "$grn File $ylw assignedComplete.csv $off saved to $dirloc $off"
    $slp1s
    read -p "Press Enter for Main Menu"
    fi

}


option_seven()
{
while true; do    
    clear
    echo -e "$red$bold"
    echo -e "******$blink DELETION SUB-MENU $offbl************************************************"
    echo -e "*** 1. Delete the downloaded file allitems.html                       ***"
    echo -e "*** 2. Delete the created text file CVEfile.TXT                       ***"
    echo -e "*** 3. Delete the wget logfile from the ./data_files directory        ***"
    echo -e "*** 4. Delete the CVEyears.TXT file from ./data_files directory       ***"
    echo -e "*** 5. Delete the CVEfile.CSV file from ./data_files directory        ***"
    echo -e "*** 6. Delete the assigned.txt file associated with option 5          ***"
    echo -e "*** 7. Delete the csvsearchyears.txt associated with option 6         ***"
    echo -e "*** 8. Delete the entire data_files directory and everything in it    ***"
    echo -e "*** 9. EXIT Back to main menu                                         ***"
    echo -e "*************************************************************************"
    read -p "Choose an option: " yn
    case $yn in
    1) rm -f $loc/allitems.html
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    2) rm -f $loc/CVEfile.txt
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    3) rm -f $loc/log_html.txt
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    4) rm -f $loc/CVEyears.txt
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    5) rm -f $loc/CVEfile.csv
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    6) rm -f $loc/assigned.txt
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    7) rm -f $loc/csvsearchyears.txt
        $mkstrs 68 0.007
        echo "Done!"
        $slp1s;;
    8) rm -R $loc
        $mkstrs 68 0.02
        echo "Done!"
        $slp1s;;
    *) echo "Back to Main Menu!"
        break;;
    esac
done

}

option_eight ()
{
    echo "Goodbye"
    echo
    exit 0  
}

option_default()
{
    echo -e $red$bold
    printf "%s\n" "***ERROR:" "$choice" "Does not compute..." "Please try again!" " " "Example for option 5: enter numerical: 5 or text: five"
    echo -e $offb
    echo -e "\033[7m"
    read -p "Press ENTER to continue back to menu"
}

###########################
### PROGRAM STARTS HERE ###
###########################

clear

intro_func

# while loop to loop menu, each case option runs a function
while true;
do

clear
$slp05
menu

echo -e "$bold$grn"
read -p "Choose an option: " choice
echo
echo -e "Implementing option number $choice"
    
$mkstrs 77 0.005
echo -e "$off"

# users can enter choice numerically or alphabetically
case $choice in
    [1] | [oO][nN][eE] )
    option_one $choice
    ;;
    [2] | [tT][wW][oO] )
    option_two
    ;;
    [3] | [tT][hH][rR][eE][eE] )
    option_three  
    ;;
    [4] | [fF][oO][uU][rR] )
    option_four  
    ;;
    [5] | [fF][iI][vV][eE] )
    option_five
    ;;
    [6] | [sS][iI][xX] )
    option_six
    ;;
    [7] | [sS][eE][vV][eE][nN] )
    option_seven
    ;;
    [8] | [eE][iI][gG][hH][tT] | [eE][xX][iI][tT] )
    option_eight
    ;;
    *) 
    option_default
    ;;
esac



done

# References:
#
# Stack Overflow, Available: "https://stackoverflow.com/questions/17021770/move-line-which-matches-pattern-to-previous-line"
# The line of code after the question posed (4th coloured box down the page): sed ':a $!N;s/\ndesc/ desc/;ta P;D'
# Lines 170 and 273 of my code make use of this code
#
# Other learning
# https://www.gnu.org/software/sed/manual/sed.html