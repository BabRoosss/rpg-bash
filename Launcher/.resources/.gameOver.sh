#!/bin/sh
clear
echo GAME OVER
sleep 3
clear
echo Try Again?
read -p [Y/N] again
if [[ $again == "Y" || $again == "y" ]]
then
    # Clear health and start over
    echo Here we go . . .
    rm -rf data/playerStats.json
    cp data/playerStatsTemplate.dat data/playerStats.json
    sleep 3
    bash .main.sh
else
    # Clear health and exit to menu
    echo GAME OVER
    rm -rf data/playerStats.json
    cp data/playerStatsTemplate.dat data/playerStats.json
    sleep 3
    bash ../main.sh
fi