#!/bin/bash
P1="Poo"
P2="Bum"
P3="Wee"
P4="Fart"
if [ $P1 = $P3 ]; 
then
    echo $P1$P2
else
    echo $P1-$P2-$P3-$P4
fi
