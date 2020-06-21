#!/bin/bash

awk 'BEGIN {
    FS=",";
    print "____________________";
    print "| Year | # of CVEs |";
}
{
    printf("| %-4s | %-9s |\n", $1, $2);
}
END {
    print("_____________");
}' ./data_files/year.txt

awk '{print $1, $2}' ./data_files/year.txt


echo "what years do you want to search for?"
read -p "years: " years


awk 'BEGIN {
}
{
    for (i=1; i<=21; i++);
        print "$years";
}    
END {

}' ./data_files/year.txt

