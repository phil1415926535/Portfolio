#!/bin/bash
# Variables

# FG Colours
red="\033[31m" # text red
grn="\033[32m" # text green
ylw="\033[33m" # text yellow
dfc="\033[39m" # default text colour

#BG Colors
dkgry="\033[100m" # dark grey background
dfbkg="\033[49m" # default background colour

bold="\033[1m" # bold text
offb="\033[21m" # turn off bold

off="\033[0m" # reset all attributes

slp="sleep 0.05"

# Menu file to be used with main assignment script
menu()
{
    echo
    echo -e "$dkrgy$ylw$bold******************************* $red!!! MENU !!!$dfc $ylw********************************"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****$grn 1. Initial download or update to latest complete CVE list         $ylw*****"
    $slp
    echo -e "*****$grn 2. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp    
    echo -e "*****$grn 3. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 4. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 4. ***AnOtHeR_oPtIoN***                                           $ylw*****"    
    $slp
    echo -e "*****$grn 6. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 7. ***AnOtHeR_oPtIoN***                                           $ylw*****"
    $slp
    echo -e "*****$grn 8. Exit program                                                   $ylw*****"
    $slp
    echo -e "*****                                                                   *****"
    $slp
    echo -e "*****************************************************************************"
    echo -e "$off"
}
menu