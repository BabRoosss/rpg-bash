#!/bin/sh
clear
echo You encounter a hot spring.
read -p "Take a Rest? [Y/n]: " rest

# Refuse rest
if [[ $rest == "n" || $rest == "N" ]]
then
    echo not rested
    sleep 3
fi

# Accept rest
if [[ $rest == "Y" || $rest == "y" || $rest == "" ]]
then
    #Get health
    health=$(cat data/playerHealth.dat)

    # Check if health is over 100
    if [[ $health -ge "100" ]]
    then
        echo
    else
        addedHealth=$(expr $health + 15)
        echo $addedHealth > data/playerHealth.dat
    fi

    echo Rested
    sleep 3
fi

# Exit
bash .main.sh