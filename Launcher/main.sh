#!/bin/sh
clear
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo                 Bab Roosss Launcher
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo
echo What app do you want to launch?
echo 1. Hello, World!
echo 2. Game
echo 3. TextEdit
echo 4. Exit
echo
read -p "> " inpt


if [[ $inpt == 1 ]]
then
    bash /workspaces/codespaces-blank/hello.sh
fi
if [[ $inpt == 2 ]]
then
    bash apps/game.sh
fi
if [[ $inpt == 3 ]]
then
    nano $1
fi
if [[ $inpt == 4 ]]
then
    echo Exiting . . .
    exit
fi