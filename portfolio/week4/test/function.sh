#!/bin/bash

function ffs
{

    echo "variable 1 a basic ffs" 

}

foo2 ()
{

# Input variables into a function
    echo "whatever: " $1 $2
    echo "all input variables in foo2" $3
    

}

ffs
foo2 hi there everyone
