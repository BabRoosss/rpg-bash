#!/bin/sh
while [ True ]
do
    clear
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo             Bab RPG Game Launcher
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo
    echo 1. Play
    echo 2. Options
    echo 3. Exit
    echo
    read -p "> " inpt


    if [[ $inpt == 1 ]]
    then
        bash /workspaces/codespaces-blank/Launcher/resources/game.sh
    fi
    if [[ $inpt == 2 ]]
    then
        echo TODO: Add options menu
    fi
    if [[ $inpt == 3 ]]
    then
        break
    fi
done
echo Goodbye!