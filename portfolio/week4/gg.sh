var=42

printTryagain()
{
    echo -e "\033[93mTry Again:\033[0m $1"
}

getNumber()
{
    read -p "$1:"
while [[ $1 != $4 ]];
do
    if (( $REPLY < $4 ));
    then
        printTryagain "Too Low"
        read -p "$1:"
    fi
    
    if (( $REPLY > $4 ));
    then
        printTryagain "Too High"
        read -p "$1:"
    fi
done

#    while [[ $1 != $4 ]];
#    do 
#        echo $1 $2 $3 $4
#        read -p "$1:"
#        if [[ $1 < $4 ]]; then
#            printTryagain "This is too low!"
#        fi
#        if [[ $1 > $4 ]]; then
#            printTryagain "This is too high!"
#        fi
#        if [[ $1 -gt $3 || $1 -lt $2 ]]; then 
#            printTryagain "Number must be between 1 and 100"
#        fi
#    done
}


echo "Please try to guess a number between 1 and 100"
getNumber "Please type a number between 1 and 100" 1 100 42
echo "Correct!"
exit