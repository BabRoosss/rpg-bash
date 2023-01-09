#!/bin/sh
clear
echo GAME OVER
sleep 3
clear
echo Try Again?
read -p [Y/N] again
if [[ $again == "Y" || $again == "y" ]]
then
    echo Again
    rm -rf data/playerStats.json
    cp data/playerStatsTemplate.dat data/playerStats.json
    bash .main.sh
else
    echo Again\'t
    rm -rf data/playerStats.json
    cp data/playerStatsTemplate.dat data/playerStats.json
    bash ../main.sh
fi