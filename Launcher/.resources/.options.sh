#!/bin/sh
cd .resources
options=1
while [ $options == 1 ]
do
    clear
    echo $options
    echo Please make a selection:
    echo 1. Change username
    echo 2. ???
    echo 3. dave
    echo 4. Exit
    echo
    read -p ">> " option
    if [[ $option == 1 ]]
    then
        read -p "Input a username: " player
        echo "{\"username\": \"$player\"}" > username.json
        echo Username changed to $player!
        sleep 3
    fi
    if [[ $option == 2 ]]
    then
        echo TODO: make more options
        sleep 1
    fi
    if [[ $option == 3 ]]
    then
        cat /dev/random
    fi
    if [[ $option == 4 ]]
    then
        options=0
    fi
done