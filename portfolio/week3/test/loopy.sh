#!/bin/bash

input="outlist.txt"
while IFS= read -r line
do
  echo "$line"
done < "$input"

