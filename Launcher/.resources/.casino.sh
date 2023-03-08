#!/bin/bash

# Remeber, the house always wins!
gamblingAddiction=True
while [ $gamblingAddiction = True ]
do
    # Fetch needed varables
    gold=$(cat data/playerGold.dat)
    clear
    echo -=-=-=-=-=================-=-=-=-=-
    echo \ \ \ \ \ \ \ \ \ \ \ \ \ \ Casino
    echo -=-=-=-=-=================-=-=-=-=-
    echo
    echo How many coins do you want to bet?
    echo Type "help" for instructions.
    echo Type "exit" to leave.
    echo You have won $winnings gold
    echo You have $gold gold
    echo
    read -p ">> " casinoBet
    echo

    if [[ $casinoBet -gt 12 ]]
    then
        echo
        echo Please enter a number between 1-12
        sleep 3
    else
    
        if [[ $casinoBet == "exit" ]]
        then
            echo
            echo You walked out of the casino . . .
            addedGold=$(expr $gold + $winnings)
            echo $addedGold > data/playerGold.dat
            sleep 3
            bash .main.sh
        fi
        
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
            echo $diceRoll
            if [[ $diceRoll == $casinoBet || $diceRoll -gt $casinoBet ]]
            then
                echo YOU WON!
                moreGold=$(expr $casinoBet \* 2)
                winnings=$(expr $winnings + $moreGold)

                if [[ $winnings -gt 50 || $winnings == 50 ]]
                then 
                    echo You left the casino after winning $winnings gold
                    sleep 2
                    bash .main.sh
                else
                    sleep 2
                fi
            elif [[ $diceRoll -lt $casinoBet ]]
            then
                echo \* insert boo womp sound \*
                moreGold=$(expr $casinoBet \* 2)
                winnings=$(expr $winnings - $moreGold)
                if [[ $winnings -lt -30 || $winnings == -30 ]]
                then 
                    echo You left the casino after losing $winnings gold
                    sleep 2
                    bash .main.sh
                else
                    sleep 2
                fi
            else
                echo umm, idk how, but something broke.
                sleep 2
            fi
        fi
    fi
done