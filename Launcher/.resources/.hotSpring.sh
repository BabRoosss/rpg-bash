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
    health=$(jq -r .health data/playerStats.json)

    # Check if health is over 100
    if [[ $health -ge "100" ]]
    then
        echo
    else
        addedHealth=$(expr $health + 15)
        sed -i '$s/}/,\n"health":"'$addedHealth'"}/' data/playerStats.json
    fi

    echo Rested
    sleep 3
fi

# Exit
bash .main.sh