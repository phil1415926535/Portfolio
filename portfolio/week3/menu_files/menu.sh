#!/bin/bash

# Colour Variables
# Reference: https://misc.flogisoft.com/bash/tip_colors_and_formatting
YE="\033[93m"   # Yellow
BL="\033[34m"   # Blue
GN="\033[92m"   # Green
RD="\033[91m"   # Red
PL="\033[35m"   # Purple
C="\033[96m"    # Cyan
LM="\033[95m"   # Magenta
BO="\033[1m"    # Bold
UL="\033[4m"    # Underline
BN="\033[5m"    # Blinking
INV="\033[7m"   # Inverted
DGB="\e[100m"   # Dark grey background
O="\033[0m"     # Off

SL="sleep 0.1"
EC="echo -e"

$EC "$INV                                    $O"
$EC "$INV                                    $O"
$EC "$INV                                    $O"
$EC "$INV    $O $BO$UL$C                          $O $INV    $O"
$EC "$INV    $O $DGB$BO$UL$C**********Menu************$O $INV    $O"
$EC "$INV    $O $YE*----$UL$BO"Select an Option"$O----*$O $INV    $O"
$EC "$INV    $O $C*                        *$O $INV    $O"
$SL
$EC "$INV    $O $PL* 1. Create a folder     *$O $INV    $O"
$SL
$EC "$INV    $O $GN* 2. Copy a folder       *$O $INV    $O"
$SL
$EC "$INV    $O $BL* 3. Set a password      *$O $INV    $O"
$SL
$EC "$INV    $O $RD* 4. Calculator          *$O $INV    $O"
$SL
$EC "$INV    $O $LM* 5. Create Week Folders *$O $INV    $O"
$SL
$EC "$INV    $O $GN* 6. Check Filenames     *$O $INV    $O"
$SL
$EC "$INV    $O $BL* 7. Download a File     *$O $INV    $O"
$SL
$EC "$INV    $O $RD* 8. Exit                *$O $INV    $O"
$SL
$EC "$INV    $O $C**************************$O $INV    $O"
$EC "$INV                                    $O"
$EC "$INV                                    $O"
$EC "$INV                                    $O"