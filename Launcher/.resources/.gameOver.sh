#!/bin/sh
username=$(cat data/playerName.dat)
playerDeathMessageMonster=$(cat data/monsterSelected.dat)
playerDeathMessage=$(cat data/monsterData/$playerDeathMessageMonster/playerDeathMessage.dat)
clear
echo GAME OVER
echo $username $playerDeathMessage

sleep 3
clear
echo Try Again?
read -p [Y/N] again
if [[ $again == "Y" || $again == "y" ]]
then
    # Clear health and start over
    echo Here we go . . .
    rm -rf data/*.dat
    cp data/templates/*.dat data/

    clear

    read -p "Input a username: " player
    echo $player > data/playerName.dat

    clear

    sleep 3
    bash .main.sh
else
    # Clear health and exit to menu
    echo GAME OVER
    rm -rf data/*.dat
    cp data/templates/*.dat data/

    clear

    read -p "Input a username: " player
    echo $player > data/playerName.dat

    clear

    sleep 3
    bash ../main.sh
fi