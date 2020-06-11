#!/bin/bash

awk '{
total =0
i=1
for(i = 1; i < 4; i++)
{
        total = total + $i
        i++
}
average = total / 3
print "the average is:", average
}' ./numbers.txt