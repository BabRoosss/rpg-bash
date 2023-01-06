#!/bin/sh
## MAIN GAME CODE
alive=1
## Entity Health
enemyHealth=50
enemyMax=50
## Enemy Name
enemy=Thing
## Monster Attack Strength
mAttak=20
## Player Name

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
main() {
    echo AHHHHH
    sleep 0.2
    deathMessage="Player Choked on Air"
    clear
    echo Health: $playerHealth/$playerMax
    echo XP: $xp
    echo Attack: $attk
    echo
    echo What would you like to do?
    echo
    echo 1. Wander
    echo 2. Inventory
    echo 3. Die i guess
    echo 4. Exit
    echo $RANDOM % 2 + 1 | bc
    read -p "> " mainChoice

    if [[ $mainChoice == "1" ]]
    then
        if [[ $RANDOM == 1 ]]
        then
            fight
        else
            xpGain
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
        exit
    fi
}

xpGain() {
    xp=$(expr $xp + 15 * $xpMulti)
    echo You got XP!
    main
}

win() {
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
    echo Monster dealt $mAttak damage!
}

fight() {
    deathMessage="Player looked at Thing for too long"
    if [[ $enemyHealth == 0 ]]
    then
        win
    fi
    echo Enemy $enemy appears!
    echo $enemy $enemyHealth/$enemyMax
    echo 1-Attack 2-Flee
    echo $usr $playerHealth/$playerMax
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
        win
    fi
    if [[ $choice == "dave" ]]
    then
        cat /dev/random
    fi
    clear
}

while [ $alive="1" ]
do
    main
done