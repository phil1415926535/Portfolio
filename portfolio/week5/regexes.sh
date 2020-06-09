#!/bin/bash


while true
do
# Menu system to choose option of which grep to run on my work
echo -e "\033[93;1;42m"
echo -e "------*Using grep to search for statements*------"
echo -e ""
sleep 0.1
echo -e "             ------*M*E*N*U*------\033[0m\033[42m"
sleep 0.1
echo -e "       1. all sed statements"
echo -e  
sleep 0.1
echo -e "       2. all lines that start with the letter 'm'"
echo -e
sleep 0.1
echo -e "       3. all lines that contain three digit numbers"
echo -e
sleep 0.1
echo -e "       4. all echo statements with at least three words"
echo -e
sleep 0.1
echo -e "       5a. all lines that would make a good password"
echo -e "            min of 2 char per word, 6 words"
echo -e "            using [:graph:] per word, separated by space"
echo -e
sleep 0.1
echo -e "       5b. all lines that would make a good password"
echo -e "            min of 6 char per word, 4 words"
echo -e "            using [:alnum:][:punct:] per word, separated by space"
echo -e
sleep 0.1
echo -e "       5c. all lines that would make a good password"
echo -e "            min of 4 char per word, 4 words"
echo -e "            using [:graph:] per word, separated by space"
echo -e
sleep 0.1
echo -e "       5d. all lines that would make a good password"
echo -e "            min of 4 char per word, 4 words"
echo -e "            using [:alnum:] per word, separated by space"
echo -e
sleep 0.1
echo -e "       5e. all lines that would make a good password"
echo -e "            min of 4 char per word, 6 words"
echo -e "            using [:alnum:] per word, separated by space"
echo -e
sleep 0.1
echo -e "       6. Choose this to EXIT"
sleep 0.1
echo -e
read -p "Choose an option: " option
echo -e "\033[0m"

case $option in
    1 )
        echo "Command: grep -wrE "sed\s" ~/student/scripts/portfolio --exclude-dir=.git --color"
        echo
        echo "Output:"
        grep -wrE "sed\s" ~/student/scripts/portfolio --exclude-dir=.git --color # finds all sed statements
        echo
        read -p "Pressing any key: back to menu"
    ;;
    2 ) 
        echo "Command: grep -riI "^m" ~/student/scripts/portfolio --exclude-dir=.git --color"
        echo
        echo "Output:"
        grep -riI "^m" ~/student/scripts/portfolio --exclude-dir=.git --color # finds all lines in files starting with m or M (-i)
        read -p "Pressing any key: back to menu"
    ;;
    3 )
        echo "Command: grep -rIE "[^0-9][0-9][0-9][0-9][^0-9]" ~/student/scripts/portfolio --exclude-dir=.git --exclude-dir=.vscode --color"
        echo
        echo "Output:"
        grep -rIE "[^0-9][0-9][0-9][0-9][^0-9]" ~/student/scripts/portfolio --exclude-dir=.git --exclude-dir=.vscode --color # finds all 3 digit numbers even if surrounded by other characters
        read -p "Pressing any key: back to menu"
    ;;
    4 )
        echo "Command: grep -wrEnI "^echo\s|[[:blank:]]{1,}echo\s" ~/student/scripts/portfolio --exclude-dir=.git --color"
        echo
        echo "Output:"
        grep -wrEnI "^echo\s|[[:blank:]]{1,}echo\s" ~/student/scripts/portfolio --exclude-dir=.git --color # finds all echo statements in files
        read -p "Pressing any key: back to menu"
    ;;
    5a )
        echo 'Command: grep -winrohIE "[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color=always | grep -v "echo"'
        echo
        echo "Output:"
        grep -wirohIE "[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}\s[[:graph:]]{2,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color=always | grep -v "echo"
        read -p "Pressing any key: back to menu"
    ;;
    5b )
        echo 'Command: grep -wrinohIE "[[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color=always | grep -v "grep"'
        echo
        echo "Output:"
        grep -wriohIE "[[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}[[:blank:]][[:alnum:][:punct:]]{6,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color=always | grep -v "grep|-wrinohIE|-wriohIE"
        read -p "Pressing any key: back to menu"
    ;;
    5c )
        echo 'Command: grep -wrinohIE "[[:graph:]]{4,}\s[[:graph:]]{4,}\s[[:graph:]]{4,}\s[[:graph:]]{4,}\s" ~/student/scripts/portfolio --exclude-dir={.git,.vscode --color}'
        echo
        echo "Output:"
        grep -wriohIE "[[:graph:]]{4,}\s[[:graph:]]{4,}\s[[:graph:]]{4,}\s[[:graph:]]{4,}\s" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color
        read -p "Pressing any key: back to menu"
    ;;
    5d )
        echo 'Command: grep -wrinohIE "[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color'
        echo
        echo "Output:"
        grep -wriohIE "[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color
        read -p "Pressing any key: back to menu"
    ;;
    5e )
        echo 'Command: grep -wrinohIE "[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color'
        echo
        echo "Output:"
        grep -wriohIE "[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}\s[[:alnum:]]{4,}" ~/student/scripts/portfolio --exclude-dir={.git,.vscode} --color
        read -p "Pressing any key: back to menu"
    ;;
    6 )
        exit 0
    ;;
esac

done