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
mAttak=20

## Player Health
playerHealth=100
playerMax=100

# Player Attack Strength
attk=25

## Player XP
xp=0

## Player XP Multiplier
xpMulti=1

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
    echo $username: $playerHealth/$playerMax
    echo XP: $xp
    echo Attack: $attk
    echo $alive
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
        fight
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
    if [[ $mainChoice == "5" ]]
    then
        error
    fi
}

xpGain() {
    xp=$(expr $xp + 15 * $xpMulti)
    echo You got XP!
    main
}

win() {
    break
    echo You won!
    sleep 5
    main
}

lose() {
    echo $deathMessage
    sleep 5
    read -p "Press Enter to Exit"
    exit
}

monsterAttk() {
    echo $enemy attacked $player and dealt $mAttk damage!
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
            fighting=0
            win
        fi
        echo Enemy $enemy appears!
        echo $enemy $enemyHealth/$enemyMax
        echo 1-Attack 2-Flee
        echo $player $playerHealth/$playerMax
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
        # monsterAttk
        clear
    done
}

while [ $alive=1 ]
do
    main
done

