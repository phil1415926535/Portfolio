#!/bin/bash
# read -p "Search CVE items by year: " year

# sed -n -e "/Name: CVE-$year/,/=/ p" allitems.txt

# read -p "Enter if CVE is a CANDIDATE(c) or ENTRY(e) or BOTH(b): " core

#if [[ $core == c ]]; then
#    sed -n -e "/Name: CVE-$year/,/=/ p" allitems.txt | sed "s/,//" | sed "s/\.$/,/" | sed -n -e "/Phase/,/Candidate/ p"
#fi
#if [[ $core == e ]]; then
#    sed -n -e "/Name: CVE-$year/,/=/ p" allitems.txt | sed "s/,//" | sed "s/\.$/,/" | sed -n -e "/Phase/,/Entry/ p"
#fi
#if [[ $core == b ]]; then
#    sed -n -e "/Name: CVE-$year/,/=/ p" allitems.txt | sed "s/,//" | sed "s/\.$/,/" | sed -n -e "/Phase/,/Candidate/ p; /Phase/,/Entry/ p"
#fi

# read -p "Enter if 'Phase' should be Assigned(a), Proposed(p), or Modified(c): " phase
#if [[ $phase == a && $core == c ]]; then
#        sed -n -e "/Name: CVE-$year/,/=/ p" allitems.txt | sed "s/,//" | sed "s/\.$/,/" | sed -n -e "/Phase/,/Candidate/ p;"
#fi



#echo "$year $core CVE's:"
#awk 'BEGIN {
 #    FS="="
  #    print"________________________________________________________"
   #   print "| 
    #  printf("filename:%10s,linenumber:%s,columns:%s,linecontent:%s\n",FILENAME,NR,NF,$0)}' /etc/passwd

# counts number of lines from grep
# grep -c "Name: CVE-1999" allitems.txt

# awk '/Name: CVE-1999/,/=/ {print $1, $2, $3, $4, $5, $6, $7 $8, $9, $10, $11}' allitems.txt

# awk '/CVE-1999/,/analysis/' {print $0}' allitems.csv

# sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -e '/=/,/=/d' | sed -ne '/Name: CVE-1999/,/Status/p'

# sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' > file.txt
# awk '/======================================================/,0' file.txt


#sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | awk '/======================================================/,0'  > file.txt
# sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Date Created: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================/"> file.txt


# how many items in the year range
# awk ' ( $2 ~ /CVE-2020/ ) { print $0 } ' file.txt | grep -E "^Name:" > file2.txt



#awk '{ for (i = 1; i <= 10; i++)
#          print $i
#}' file.txt

#awk ' ( $2 ~ /CVE-2020/ ) {
#    if ($1 = "Name:")
#        print $0;
#}' file.txt | grep -E "Name: CVE"
