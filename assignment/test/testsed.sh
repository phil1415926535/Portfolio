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


# sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | awk '/======================================================/,0'  > file.txt
# sed -e 's/<[^>]*>//g' allitems.html | sed -e 's/Name:/\n======================================================\n======================================================\nName:/' | sed -n '/======================================================/,/Back to top/ p' | sed "1s/^/Created Date: $(date +%Y%m%d)\n/" | sed "s/Back to top/======================================================/"> file.txt


# how many items in the year range
# awk ' ( $2 ~ /CVE-2020/ ) { print $0 } ' file.txt | grep -E "^Name:" > file2.txt



#awk '{ for (i = 1; i <= 10; i++)
#          print $i
#}' file.txt

#awk ' ( $2 ~ /CVE-2020/ ) {
#    if ($1 = "Name:")
#        print $0;
#}' file.txt | grep -E "Name: CVE"


#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-1999/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/1999,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2000/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2000,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2001/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2001,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2002/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2002,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2003/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2003,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2004/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2004,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2005/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2005,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2006/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2006,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2007/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2007,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2008/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2008,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2009/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2009,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2010/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2010,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2011/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2011,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2012/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2012,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2013/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2013,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2014/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2014,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2015/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2015,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2016/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2016,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2017/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2017,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2018/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2018,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2019/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2019,/" >> $loc/numfile.txt
#    awk ' ( $1 ~ /Name:/ && $2 ~ /CVE-2020/ ) { print $0 } ' $loc/CVEfile.txt | wc -l | sed "s/^/2020,/" >> $loc/numfile.txt

# for number in $years
# do
# echo $number
# done

# testing to make csv file from whole file
#sed -i "/Vote/,/=/d" CVEfile.txt

#sed '/Name:/{N;s/\n/,/}' CVEfile.txt | sed '/Status:/{N;s/\n/,/}' |sed '/Description:/{N;s/\n/,/}' | sed '/Phase:/{N;s/\n/,/}' | sed '/Reference:/{N;s/\n/,/}' | sed '/Votes:/{N;s/\n/,/}' | sed '/Voter Comments:/{N;s/\n/,/}'

#sed 's/,/ /g' CVEfile.txt
#sed -i 's/&lt;br&gt;//g' CVEfile.txt
#sed -i 's/&gt//g'
#sed -i "s/&amp;/ /" CVEfile.txt

sed -e 's/^Reference:/\ | /' CVEfile.txt | sed '/\|/!{N;s/\n/,/g}'
sed -i "/Votes:/, /=/{$!d}" CVEfile.txt
sed "/Votes:/, /=/d" 1999.txt | sed "s/Name:/======================================================\nName:/" | sed -e '$s/$/\n=====================================================/' > 1999new.txt
sed -e 's/^Reference:/\ | /' 1999new.txt | sed '/\|/!{N;s/\n/,/g}'
sed 's/$/,/g' 1999new.txt | sed -e 's/======================================================,/\n/' | sed -e 's/=====================================================,/\n/' | sed -e 's/^,/\n/' | sed '/^.?/!N;s/\n//' | sed -e 's/^Name:/\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nName:/' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//'

sed 's/$/,/g' 1999new.txt | sed -e 's/======================================================,/\n/' | sed -e 's/=====================================================,/\n/' | sed -e 's/^,/\n/' | sed '/^.?/!N;s/\n//' | sed -e 's/^Name:/\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nName:/' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed -e '/^.?/!N;s/\n//' | sed 's/,Status:/,/g' | sed 's/,Phase:/,/g' | sed 's/,Description:/,/g' | sed 's/Name: //g' > hoping.txt
sed 's/$/,/g' 1999.txt | sed 's/Name:/=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\nName:/'

#####################################
### This time with CVEfile.txt :s ###
sed -i 's/======================================================/=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n/' CVEfile.txt
sed -i "/Votes:/,/=/d" CVEfile.txt
sed -i "/Also see/,/=/d" CVEfile.txt
sed -i "/Christey;/,/=/d" CVEfile.txt
# sed -i 's/=/\n/' CVEfile.txt
# sed '/^.?/!N;s/\n//' CVEfile.txt



https://www.gnu.org/software/sed/manual/sed.html
#### ---> Best thing ever - discovered something new
sed -E -e ':a $!N;s/\n(Description:|Status:|Phase:)/ ,/;ta P;D' 1999.txt
# Reference for below line sed ':a $!N;s/\ndesc/ desc/;ta P;D' "https://stackoverflow.com/questions/17021770/move-line-which-matches-pattern-to-previous-line" move line which matches pattern to previous line
# Had already experimented with  **sed '/^/!N;s/\n//'** and was going to use multiples of this until came across this one
# sed -Ee '/./s/ \| /,/' line is adapted from https://www.gnu.org/software/sed/manual/sed.html#Text-search-across-multiple-lines (Section 6.3 Multiline techniques - using D,G,H,N,P to process multiple lines ***sed '/./{H;$!d} ; x ; s/REGEXP/REPLACEMENT/'***)
sed 's/Reference:/ \| /' 1999.txt | sed -E -e ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D'
sed 's/Reference:/ \| /' 1999.txt | sed -E -e ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D'
sed 's/Reference:/ \| /' 1999.txt | sed -Ee ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D' | sed -Ee '/./s/ \| /,/'
sed 's/Reference:/ \| /' 1999.txt | sed -Ee ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D' | sed -Ee '/./s/ \| /,/' | sed '/^S/d' | sed '/=/d'
sed 's/Reference:/ \| /' 1999.txt | sed -Ee ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D' | sed -Ee '/./s/ \| /,/' | grep -E "Name:"
sed 's/Reference:/ \| /' 1999.txt | sed -Ee ':a $!N;s/\n(Description:|Status:|Phase:)/,/;ta P;D' | sed -Ee ':a $!N;s/\n \| / \| /;ta P;D' | sed -Ee '/./s/ \| /,/' | grep -E "Name:" | sed 's/Name: //' | sed '1s/^/\"Name\",\"Description\",\"Phase\",\"Status\",\"Reference\"\n/' > hoping.txt
