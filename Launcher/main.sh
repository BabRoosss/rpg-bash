#!/bin/sh
cd ..
cd Launcher
clear
echo $1 > .resources/data/debug.dat
pwd
error2=$(cat errorHandling/error.dat)
errorMessage2=$(cat errorHandling/errorMessage.dat)
main=True
username=$(cat .resources/data/playerName.dat)
while [ $main == True ]
do
    error1=$(cat .resources/errorHandling/error.dat)
    error2=$(cat errorHandling/error.dat)
    errorMessage1=$(cat .resources/errorHandling/errorMessage.dat)
    errorMessage2=$(cat errorHandling/errorMessage.dat)
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
    echo   > errorHanding/errorMessage.dat
    echo 
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo            Bab RPG Game Launcher
    echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    echo
    echo $username
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