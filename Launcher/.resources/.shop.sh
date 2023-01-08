#!/bin/sh

gold=$(jq -r .gold data/playerStats.json)

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

    health=$(jq -r .health data/playerStats.json)
    if [[ $health < 100 ]]
    then
        echo Sorry! I can\'t sell you this potion! Your health is already max!
    else
        ## GET GOLD AND PLAYER HEALTH
        gold=$(jq -r .gold data/playerStats.json)
        subGold=$(expr $gold - 25)
        addedHealth=$(expr $health + 25)
        ## REMOVE FILE AND IMMEDIATLY MAKE IT AGAIN (duck tape soulution, i know.)
        #rm data/playerStats.json
        #touch data/playerStats.json
        ## MAKE UPDATED ENTRIES FOR HEALTH AND GOLD
        sed -i '$s/}/,\n"health":"'$addedHealth'"}/' data/playerStats.json
        sed -i '$s/}/,\n"gold":"'$subGold'"}/' data/playerStats.json

    fi
    bash .main.sh  
fi