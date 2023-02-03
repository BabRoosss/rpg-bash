#!/bin/sh
clear
echo You encounter a hot spring.
read -p "Take a Rest? [Y/n]: " rest

if [[ $rest == "n" || $rest == "N" ]]
then
    echo not rested
    sleep 3
fi

if [[ $rest == "Y" || $rest == "y" || $rest == "" ]]
then
    health=$(jq -r .health data/playerStats.json)

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

bash .main.sh