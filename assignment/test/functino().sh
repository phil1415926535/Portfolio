functino()
{
   if [[ "$i" == "1999" ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-1999" csvsearch.txt | sed "s/^/1999,/" >> $loc/csvsearchyears.txt
    fi
    if [[ "$i" == "2000" ]]; then
        grep -iE "^CVE-2000.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-2000" csvsearch.txt | sed "s/^/2000,/" >> $loc/csvsearchyears.txt
    fi
    if [[ "$i" == "2001" ]]; then
        grep -iE "^CVE-2001.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-2001" csvsearch.txt | sed "s/^/2001,/" >> $loc/csvsearchyears.txt
    fi
    if [[ "$i" == "2002" ]]; then
        grep -iE "^CVE-2002.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-2002" csvsearch.txt | sed "s/^/2002,/" >> $loc/csvsearchyears.txt
    fi
    if [[ "$i" == "2003" ]]; then
        grep -iE "^CVE-2003.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-2003" csvsearch.txt | sed "s/^/2003,/" >> $loc/csvsearchyears.txt
    fi
    if [[ "$i" == "2004" ]]; then
        grep -iE "^CVE-2004.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
        grep -cE "^CVE-2004" csvsearch.txt | sed "s/^/2004,/" >> $loc/csvsearchyears.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" $loc/CVEfile.csv >> $loc/csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        grep -iE "^CVE-1999.*[^[:alnum:]]$searchterm[^[:alnum:]]" CVEfile.csv >> csvsearch.txt
    fi

}