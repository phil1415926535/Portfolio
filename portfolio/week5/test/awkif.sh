#!/bin/bash

awk '{
    if ($1 > 100)
        printf "%10.2f is a big number\n",$1
    else
        printf "%10.2f is not a big number\n",$1
}' ./numbers.txt
