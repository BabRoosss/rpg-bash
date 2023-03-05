#!/bin/sh
fighting=1

## Entity Health
enemyHealth=$(cat data/monsterData/$monsterChosen/health.dat)
enemyMax=$(cat data/monsterData/$monsterChosen/maxHealth.dat)

## Enemy Name
enemy=$(cat data/monsterData/$monsterChosen/name.dat)

## Monster Attack Strength
mAttk=$(cat data/monsterData/$monsterChosen/attack.dat)

## Player Health
playerHealth=$(cat data/playerHealth.dat)
playerMax=$(cat data/playerMaxHealth.dat)

# Player Attack Strength
attk=$(cat data/playerAttack.dat)

# Main loop
while [ True ]
do

    monsterAttk() {
        echo $enemy attacked $username and dealt $mAttk damage!
        sleep 2

        playerHealth=$(expr $playerHealth - $mAttk)
        echo $playerHealth > data/playerHealth.dat

    }

    clear
    deathMessage="Player looked at Thing for too long"
    if [[ $enemyHealth == 0 ]]
    then
        bash .main.sh win
    fi
    if [[ $playerHealth == 0 || $playerHealth < 0 ]]
    then
        bash .gameOver.sh
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
        bash .main.sh win
    fi
    if [[ $choice == "dave" ]]
    then
        cat /dev/random
    fi
    if [[ $enemyHealth == 0 ]]
    then
        additionalMessage="$username killed $enemy"
        bash .main.sh win

    fi
    if [[ $playerHealth == 0 ]]
    then
        bash .gameOver.sh
    fi
    monsterAttk
    clear
done