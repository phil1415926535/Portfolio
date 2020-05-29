#!/bin/bash

# for loop with variables
# takes each variable/input and runs it through the do loop one at a time
for fruit in Apple Mango Strawberry Orange Banana
do 
    echo "FRUIT: $fruit"
done

echo

# from files
for OUTPUT in apple.txt mango.txt strawberry.txt orange.txt banana.txt
do
    echo "FRUIT: $(cat $OUTPUT)"
done



# Reference:
# "Bash For Loop Examples" at https://www.cyberciti.biz/faq/bash-for-loop/