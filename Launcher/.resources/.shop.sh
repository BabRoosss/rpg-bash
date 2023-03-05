#!/bin/sh

#Check if player still has gold.
gold=$(cat data/gold.dat)
username=$(cat data/username.dat)
if [[ $gold == 0 || $gold < 0 ]]
then
    echo poor lol
    sleep 2
fi

clear
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo \# Gold: $gold
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo \# 1. Healing Potion                                                    
echo \# 2. Sword
echo \# 3. 5 XP
echo \# 4. Exit
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
read -p "$ " shop

if [[ $shop == 1 ]]
then
    
    # Get health as variable.
    health=$(cat data/health.dat)
    
    # Is the players health over or at 100?
    if [[ $health < 100 ]]
    then
        echo Sorry! I can\'t sell you this potion! Your health is already max!
        echo $health
        sleep 5
    else
        
        potionHealth=1

        ## GET GOLD AND PLAYER HEALTH
        gold=$(cat data/gold.dat)
        subGold=$(expr $gold - 25)
        addedHealth=$(expr $health + 25)

        ## MAKE UPDATED ENTRIES FOR HEALTH AND GOLD
        echo $addedHealth > data/health.dat
        echo $subGold > data/gold.dat
        
        if [[ $potionHealth == "1" ]]
        then
            echo $addedHealth > data/health.dat
            potionHealth=0
        fi

    fi
    exit
fi