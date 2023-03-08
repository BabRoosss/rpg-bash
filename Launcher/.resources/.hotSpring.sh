#!/bin/sh
clear
echo You encounter a hot spring.
read -p "Take a Rest? [Y/n]: " rest

# Refuse rest
if [[ $rest == "n" || $rest == "N" ]]
then
    echo
    sleep 1
fi

# Accept rest
if [[ $rest == "Y" || $rest == "y" || $rest == "" ]]
then
    #Get health
    health=$(cat data/playerHealth.dat)
    addedHealth=$(expr $health + 15)
    echo $addedHealth > data/playerHealth.dat
    health=$(cat data/playerHealth.dat)
    # Check if health is over 100
    if [[ $health == 100 ]]
    then
        echo
    fi
    if [[ $health -gt 100 ]]
    then
        excessHealth=$(expr $health - 100)
        health=$(expr $health - $excessHealth)
        echo $health > data/playerHealth.dat
    fi
    
    echo You sink into the warm water. You feel replenished.
    sleep 3
fi

# Exit
bash .main.sh