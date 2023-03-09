#!/bin/sh
cd ..
cd Launcher
cd .resources
clear
echo $1 > data/debug.dat
pwd
error2=$(cat errorHandling/error.dat)
errorMessage2=$(cat errorHandling/errorMessage.dat)
main="True"
username=$(cat data/playerName.dat)
while [ $main == "True" ]
do
    error1=$(cat errorHandling/error.dat)
    errorMessage1=$(cat errorHandling/errorMessage.dat)
    username=$(cat data/playerName.dat)
    clear
    ## ERROR CHECKING
    if [[ $error2 == "1" ]]
    then
        echo The game crashed! The below message may have some more info.
        echo $errorMessage1
        echo $errorMessage2
    else
        sleep 0.01
    fi
    echo 0 > errorHandling/error.dat
    echo   > errorHandling/errorMessage.dat
    echo 
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo            Bab RPG Game Launcher
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo
    echo $username
    echo
    echo 1. Play
    echo 2. Options
    echo 3. Mods
    echo 4. About
    echo 5. Exit
    echo
    
    read -p "> " inpt

    if [[ $inpt == 1 ]]
    then
        bash start.sh
    fi
    if [[ $inpt == 2 ]]
    then
        bash .options.sh
    fi
    if [[ $inpt == 3 ]]
    then
        bash .mods.sh
    fi
    if [[ $inpt == 4 ]]
    then
        bash .about.sh
    fi
    if [[ $inpt == 5 ]]
    then
        main="False"
    fi
done
clear
echo Goodbye!
sleep 5
cd ..
cd Launcher
clear
$SHELL