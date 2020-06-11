#!/bin/bash

awk 'function PrintInRed(string){
    printf "\033[1;31m%s\033[0m\n", string
}

{
    PrintInRed($0)
}' numbers.txt