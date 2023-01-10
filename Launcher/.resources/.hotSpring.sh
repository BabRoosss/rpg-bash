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
    echo Rested
    sleep 3
fi

bash .main.sh