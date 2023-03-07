#!/bin/bash

# Remeber, the house always wins!
gamblingAddiction=True
while [ $gamblingAddiction = True ]
do
    # Fetch needed varables
    gold=$(cat data/playerGold.dat)

    echo -=-=-=-=-=================-=-=-=-=-
    echo \ \ \ \ \ \ \ \ \ \ \ \ \ \ Casino
    echo -=-=-=-=-=================-=-=-=-=-
    echo
    echo How many coins do you want to bet?
    echo Type "help" for instructions.
    echo Type "exit" to leave.
    echo
    read -p ">> " casinoBet
    echo

    if [[ $casinoBet == "help" ]]
    then
        cat data/casinoRules.dat
        echo
        read -p "Press Enter to Continue . . . "
    fi
    # Some logic to make sure player has enough coins
    if [[ $casinoBet -gt $gold ]]
    then
        echo
        echo Don't go spending money you don't have . . .
        sleep 3
    elif [[ $casinoBet -lt 0 ]]
    then
        echo
        echo . . . 
        echo do you know how money works?
        sleep 3
    else
        echo
        echo You placed $casinoBet onto the table.
        echo The croupier rolls the dice and . . .
        diceRoll=$(python -S -c "import random; print(random.randrange(2,12))")
        sleep 2
    fi
done