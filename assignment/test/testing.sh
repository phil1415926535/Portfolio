#!/bin/bash
loc="./data_files"

Function_test1()
{
echo -e "This option will tell you how many CVE Names a search term is in per year"
echo -e "Enter which years between 1999 and 2020 to be searched"
read -a array
echo ${array[@]}

read -p "Enter a company or type of vulnerability or other term to search for: " searchterm
rm -f $loc/csvsearchyears.txt
touch $loc/csvsearchyears.txt

for i in ${array[@]}; do
    grep -iE "^CVE-$i.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv | grep -cE "^CVE-$i" $loc/csvsearch.txt | sed "s/^/$i,/" >> $loc/csvsearchyears.txt
done

 
    echo
    echo
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

}



fun_func()
{
    rm -f $loc/assigned.txt
    echo -e "This option will allow you to type in a search term and output the CVE year and the Assigned year, for comparison"
    echo -e "The CVE number contains the year and the case number that it was submitted"
    echo -e "The date it is assigned may be a variable date"
    echo -e "This operation uses the CVEfile.csv file"
    read -p "Enter search term: " searchterm
    
    grep -iE "[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv | grep -oE "(CVE-[[:digit:]]*-[[:digit:]]*,|Assigned \([0-9]{8}\))" | sed -Ee ':a $!N;s/\n(Assigned )//;ta P;D'| sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})/\1--\3\/\2/' | sed -E 's/[()]//g' > $loc/assigned.txt
    echo "Done"
    sleep 1

    echo -e "Table for search term $grn$bold \033[33m $searchterm \033[0m   $off"
    awk 'BEGIN {
        FS=",";
        print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
        print "@@@                |  \033[31;1mDate Assigned\033[0m       @@@";
        print "@@@ \033[31;1mCVE Number\033[0m     | \033[31m(Year--Day/Month)\033[0m    @@@";
        print "@@@________________|______________________@@@";
    }
    {
        printf("@@@ \033[33m%-14s\033[0m | \033[35m%-20s\033[0m @@@\n", $1, $2);
    }
    END {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
        sed -i "1s/^/\"CVE Name\",\"Date Assigned\"\n/" $loc/assigned.txt
        cp $loc/assigned.txt $dirloc
        echo -e "$grn File saved to $dirloc $off"
        read -p "Press ENTER to go back to main menu"
        $slp1s
    fi


    #sed -Ee ':a $!N;s/\n(Assigned )/,/;ta P;D' > file.txt


    #grep -iE "[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv | grep -oE "CVE-[[:digit:]]*-[[:digit:]]*,| ([0-9]{8}" file.txt
    #grep -iE "[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv | grep -oE "Assigned \([0-9]{8}\)" | grep -oE "([0-9]{8})"

    #for i in $R2; do
    #    echo $i >> file.txt
    #done
    
    #for j in $R1; do
    #  echo $j | sed "s/^/$j/" >> file.txt
    #done   

    # grep -iE "[^[:alnum:]]ford[^[:alnum:]]" CVEfile.csv | sed 's/,.*/,/' | sed "s/^/$i/" > file.txt
    # sed "s/^/$i,/" > file.txt
    # grep -cE "^Name: CVE-$i" $loc/CVEfile.txt | sed "s/^/$i,/
    # sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})/\1--\3\/\2/' file.txt # 3rd answer down
}


Function_test1
fun_func
