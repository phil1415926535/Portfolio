#!/bin/bash

awk 'BEGIN {
    FS=":";
    print "|Name      | Price    |" }
    { printf "|%-10s| %-8s |\n", $1, $2 }
    END{printf "There are %d items total!\n", NR}' ./info.txt
