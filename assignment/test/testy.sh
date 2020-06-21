#!/bin/bash

for i in {1..100}
do
printf '%.s*' {1..$i}
sleep 1
done
