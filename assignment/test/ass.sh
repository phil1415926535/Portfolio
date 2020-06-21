#!/bin/bash

# Set variables
loc="./data_files"
dl_loc_txt="https://cve.mitre.org/data/downloads/allitems.txt"
dl_loc_csv="https://cve.mitre.org/data/downloads/allitems.csv"
menu="./script_files/menu.sh"
options="./script_files/options.sh"
test="./test/args.sh"
mkstrs="./script_files/makestars.sh"

# Colours
grn="\033[32m" # text green
ylw="\033[33m" # text yellow
bold="\033[1m" # bold text
off="\033[0m" # reset all attributes


while true;
do
    
    sleep 0.1
    $menu
   
    echo -e "$bold$grn"

    read -p "Choose an option: " choice
    echo
    echo -e "Implementing option $choice"
    
    $mkstrs 77 0.005
    echo -e "$off"

    if [[ $choice == 8 || $choice == exit ]]; then exit; fi
    
    $options $choice
 
done