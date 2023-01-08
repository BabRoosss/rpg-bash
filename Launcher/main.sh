#!/bin/sh
main=True
while [ $main == True ]
do


    ## ERROR CHECKING
    if [[ $error == "1" ]]
    then
        echo if you are seeing this, something went wrong.
    else
        sleep 0.01
    fi
    echo $error
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo            Bab RPG Game Launcher
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo
    echo 1. Play
    echo 2. Options
    echo 3. Exit
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
        main=False
    fi
done
clear
echo Goodbye!
sleep 5
clear
exit