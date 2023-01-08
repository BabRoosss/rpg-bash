#!/bin/sh
cd .resources
## FIND USERNAME

username=$(jq -r .username username.json)

if [[ $username == "" ]]
then
    username="Player"
else
    echo
fi

## INIT ERROR HANDELING VARIABLE
error="error"
clear

## MAIN GAME CODE
alive=1

## Entity Health
enemyHealth=50
enemyMax=50

## Enemy Name
enemy=Thing

## Monster Attack Strength
mAttk=20

## Player Health
playerHealth=100
playerMax=100

# Player Attack Strength
attk=25

## Player XP
xp=0

## Player XP Multiplier
xpMulti="1"

## FUNCTIONS
error() {
    if [[ $error == "error" ]]
    then
        echo if your seeing this, it means that i messed up somehow.
        sleep 3
        clear
        echo going back to title in 3 . . .
        sleep 1
        clear 
        echo going back to title in 2 . . .
        sleep 1
        clear 
        echo going back to title in 1 . . .
    else
        echo
    fi
}

shop() {
    clear
    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
    echo \# 1. Healing Potion                                                    
    echo \# 2. Sword
    echo \# 3. 5 XP
    echo \# 4. Exit
    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
    read -p "$ " shop

    echo TODO: Implement later
    sleep 2
}

main() {
    if [[ $alive == 0 ]]
    then
        break
    else
        echo
    fi
    echo AHHHHH
    sleep 0.2
    deathMessage="$username Choked on Air"
    clear
    echo $additionalMessage
    randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
    echo $username: $playerHealth/$playerMax
    echo XP: $xp
    echo Attack: $attk
    echo 
    echo What would you like to do?
    echo
    echo 1. Wander
    echo 2. Inventory
    echo 3. Die i guess
    echo 4. Exit
    echo $1
    read -p "> " mainChoice

    if [[ $mainChoice == "1" ]]
    then
        randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
        if [[ $randEncounter == 1 ]]
        then
            fight
        fi
        if [[ $randEncounter == 2 ]]
        then
            xpGain
        fi
        if [[ $randEncounter == 3 ]]
        then
            shop
        fi
        if [[ $randEncounter == 4 ]]
        then
            echo 4
            sleep 1
        fi
        if [[ $randEncounter == 5 ]]
        then
            echo 5
            sleep 1
        fi
        if [[ $randEncounter == 6 ]]
        then
            echo 6
            sleep 1
        fi
        if [[ $randEncounter == 7 ]]
        then
            echo 7
            sleep 1
        fi
        if [[ $randEncounter == 8 ]]
        then
            echo 8
            sleep 1
        fi
        if [[ $randEncounter == 9 ]]
        then
            echo 9
            sleep 1
        fi
        if [[ $randEncounter == 10 ]]
        then
            echo 10
            sleep 1
        fi
    fi
    if [[ $mainChoice == "2" ]]
    then
        inventory
    fi
    if [[ $mainChoice == "3" ]]
    then
        lose
    fi
    if [[ $mainChoice == "4" ]]
    then
        error="no error"
        exit
    fi
    if [[ $mainChoice == "reload" ]]
    then
        bash start.sh
    fi
    if [[ $mainChoice == "5" ]]
    then
        shop
    fi
}

xpGain() {
    clear
    xp=$(expr $xp + 15)
    echo You got XP!
    sleep 3
    main
}

win() {
    echo You won!
    sleep 5
    xpGain
}

lose() {
    echo $deathMessage
    sleep 5
    read -p "Press Enter to Exit"
    exit
}

monsterAttk() {
    echo $enemy attacked $username and dealt $mAttk damage!
    sleep 2
    playerHealth=$(expr $playerHealth - $mAttk)
}

fight() {
    fighting=1
    while [ True ]
    do
        clear
        deathMessage="Player looked at Thing for too long"
        if [[ $enemyHealth == 0 ]]
        then
            win
        fi
        echo Enemy $enemy appears!
        echo $enemy $enemyHealth/$enemyMax
        echo 1-Attack 2-Flee
        echo $username $playerHealth/$playerMax
        read -p ":: " choice


        if [[ $choice == "1" ]]
        then
            echo You attacked $enemy and dealt $attk damage!
            sleep 2
            enemyHealth=$(expr $enemyHealth - $attk)
        fi
        if [[ $choice == "2" ]]
        then
            echo You ran away!
            fighting=0
            win
        fi
        if [[ $choice == "dave" ]]
        then
            cat /dev/random
        fi
        if [[ $enemyHealth == 0 ]]
        then
            additionalMessage="$username killed $enemy"
            win

        fi
        monsterAttk
        clear
    done
}

while [ $alive=1 ]
do
    main
done

