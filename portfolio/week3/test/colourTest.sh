#! /bin/bash

START=$(date +%s)

# Reference: https://askubuntu.com/questions/623855/changing-the-text-color-in-ubuntu-terminal
# Black \033[30m
# Red \033[31m
# Green \033[32m
# Brown \033[33m
# Blue \033[34m
# Purple \033[35m
# Cyan \033[36m
# Grey \033[37m
echo -e "\033[31m Hello $USER , goodmorning and how are you feeling today? \033[0m"


read -p "(Options are: happy, sad, tired, energetic, rejuvenated, hmmph): " feeling

case $feeling in
happy)
    echo "YAY !!! happy happy !!!"
    for fgbg in 38 48 ; do # Foreground / Background
    for color in {0..255} ; do # Colors
        # Display the color
        printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
        # Display 6 colors per lines
        if [ $((($color + 1) % 6)) == 4 ] ; then
            echo # New line
        fi
    done
    echo # New line
done
;;
sad)
    echo "oh no, dont worry, things will improve!"
;;
tired)
    echo "go back to bed then"
;;
energetic)
    echo "full of energy ready to start the day !!!"
;;
rejuvenated)
    echo "refreshed and no need for coffee!?!?! :P"
;;
hmmph)
    echo "go back to bed then"
;;
*)  echo "does not compute!!!"
;;
esac

echo
unset MYPWD
prompt="Please insert the password: "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    MYPWD+="$char"
done
echo "$char" | sha256sum > file.txt


echo
echo
echo "Please wait while securely storing password..."
echo .
sleep 1
echo ..
sleep 1
echo ...
sleep 1
echo ....
sleep 1
echo .....
sleep 1
echo ......
sleep 1
echo ...................
sleep 2
echo .................
sleep 1
echo .................
sleep 1
echo .............................
echo "_*d O n E*_"
echo

R1=$(cat file.txt)

echo $R1

echo "now hashing the hash for good measure"
echo "$R1" | sha256sum > file.txt
echo
echo .
sleep 2
echo ..
echo -e 


 

LASTARG="${@: -1}"
echo $LASTARG

END=$(date +%s)
DIFF=$(( $END - $START ))
DIFF=$(( $DIFF / 60 ))
echo $DIFF
exit 0