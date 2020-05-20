#!/bin/bash

R1="POO BUM WEE FART"
R2=" hahahaha!!!"
R3="xcowsay -r 1000 --cow-size large"
R4="cowsay"
R5="xcowsay -r 1000 -l --image alt_image.jpeg"

echo "Please type in your name:" | $R4
read name
echo "Hello and welcome to you $name" | $R3
echo "I'm Mrs Cow and I'm happy to meet you $name" | $R3
echo "I hope we can be friends - I like to say a lot of things such as $R1$R2" | $R3

echo "Please tell me what is your favourite food, by typing it below" | $R4
read food
    if [[ $food == $name ]];
    then
        echo "This is not possible, you are a silly billy! $R1 $R2 - Come back when you tell me the truth !!!!" | $R4
        echo "Roarrrrrrrrrrrrrr I'm feeling hungry" | $R4 -f dragon
        exit
    fi

echo "Oh! You like to eat $food, I like to eat $food too $R1" | $R3

echo "So $name what is your favourite game to play?" | $R4
read game
    if [[ (( $game == $name )) || (( $game == $food )) ]];
    then 
        echo "This is not possible, you are thinking that I am stupid - SAY HI TO MY FRIEND THE DRAGON!!!" | $R3 
        echo "I am going to breathe fire on you!!!" | $R4 -f dragon
        exit
    fi
echo "Thats nice, you must really enjoy $game" | $R3

echo "Do you think I would like $game? please answer yes or no" | $R4
read answergame
if [ $answergame = yes ]; 
then
    echo "Great - lets go and play $game now $name" | $R3
else 
    echo "Well I have to go now, need to $R1 on some $food while you play your $game game!" | $R3
fi

echo "HAVE A NICE DAY $name !!!" | $R3
echo "Any friend of Mrs Cow is a friend of mine too - Have a good day my friend" | $R5 --cow-size small

echo 0
