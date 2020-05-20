#!/bin/bash
COUNTER=1
until [ $COUNTER = 10000000 ];
do
    echo $COUNTER
    let COUNTER=COUNTER+1
done
