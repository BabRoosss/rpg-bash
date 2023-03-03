#!/bin/sh
main=True
cd ..
cd Launcher
username=$(cat .resources/data/username.dat)
while [ $main == True ]
do
    ## ERROR CHECKING
    if [[ $error == "1" ]]
    then
        echo if you are seeing this, something went wrong.
    else
        sleep 0.01
    fi
    clear
    echo $error
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo            Bab RPG Game Launcher
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo
    echo Username: $username
    echo
    echo 1. Play
    echo 2. Options
    echo 3. About
    echo 4. Exit
    echo
    read -p "> " inpt

    if [[ $inpt == 1 ]]
    then
        bash .resources/start.sh
    fi
    if [[ $inpt == 2 ]]
    then
        bash .resources/.options.sh
    fi
    if [[ $inpt == 3 ]]
    then
        bash .resources/.about.sh
    fi
    if [[ $inpt == 4 ]]
    then
        main=False
    fi
done
clear
echo Goodbye!
sleep 5
clear
$SHELL