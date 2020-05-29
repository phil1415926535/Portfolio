#! /bin/bash

echo "please enter your name"
read name

if [ "$name" = "Rob" ]; then
    echo "Rob is a very cool name"
else
    echo "Hi $name"
fi
