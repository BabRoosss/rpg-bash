#!/bin/sh
# Make sure the active directory is in the .resources folder to edit .jsons
cd .resources

# Start loop
options=1
while [ $options == 1 ]
do
    clear
    echo $options
    echo Please make a selection:
    echo 1. Change username
    echo 2. Delete all user data
    echo 3. dave
    echo 4. Exit
    echo
    read -p ">> " option
    if [[ $option == 1 ]]
    then
        # Changing username
        read -p "Input a username: " player
        echo $player > data/playerName.dat
        echo Username changed to $player!
        sleep 3
    fi
    if [[ $option == 2 ]]
    then
        # Delete user data (i.e. inventory, level, xp, username, any temporary files.)
        echo ARE YOU SURE YOU WANT TO DO THIS?
        echo This action is not reversable.
        echo
        read -p "[y/N]" confirm

        # Many confirmations
        if [[ $confirm == "" ]]
        then
            echo Canceling . . .
        fi
        if [[ $confirm == "n" ]]
        then
            echo Canceling . . .
        fi
        if [[ $confirm == "N" ]]
        then
            echo Canceling . . .
        fi
        if [[ $confirm == "Y" ]]
        then
            echo Please type "Delete User Data"
            confirm=""
            read -p ">" confirm
            if [[ $confirm == "Delete User Data" ]]
            then
                # Remove all data and copy in defaults.
                
                #leagacy support
                rm data/*.json

                rm data/*.dat   
                #cp data/templates/health.dat data/health.dat
                #cp data/templates/inventory.dat data/inventory.dat
                #cp data/templates/level.dat data/level.dat
                #cp data/templates/xp.dat data/xp.dat
                #cp data/templates/gold.dat data/gold.dat
                #cp data/templates/error.dat data/error.dat
                #touch data/username.dat 
                #touch data/tmp.dat
                #touch data/debug.dat
                cp data/templates/*.dat data/
            else
                echo Canceling . . .
            fi
        fi
        if [[ $confirm == "y" ]]
        then
            echo Canceling . . .
        fi

        sleep 1
    fi
    if [[ $option == 3 ]]
    then
        # dave
        cat /dev/random
    fi
    if [[ $option == 4 ]]
    then
        # Exit the loop
        options=0
    fi
done