#! /bin/bash

# saves STDOUT to file1.txt and STDERR to file2.txt
ls -l 1>file1.txt 2>file2.txt

# Saved STDOUT and STDERR to the same file
ls -l >& file1.txt

