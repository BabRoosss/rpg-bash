#!/bin/sh
shopping=True
#Check if player still has gold.
gold=$(cat data/playerGold.dat)
username=$(cat data/playerName.dat)
if [[ $gold == 0 || $gold < 0 ]]
then
    echo Sorry, you don\'t have enough gold!
    sleep 3
    bash .main.sh
fi
while [ $shopping = True ]
do
    gold=$(cat data/playerGold.dat)
    clear
    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
    echo \# Gold: $gold \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \# 
    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
    echo \# 1. Weapons \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \#                                       
    echo \# 2. Potions \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \# 
    echo \# 3. something \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \# 
    echo \# 4. Exit \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \# 
    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
    read -p "$ " shopMain

    if [[ $shopMain == "1" ]]
    then
        bash shopData/shopWeapon.sh
        sleep 3
    fi

    if [[ $shopMain == "2" ]]
    then
       bash shopData/shopPotions.sh
       sleep 3
    fi

    if [[ $shopMain == "3" ]]
    then
        echo something Buy Menu
        sleep 3
    fi

    if [[ $shopMain == "4" ]]
    then
       bash .main.sh
    fi
done