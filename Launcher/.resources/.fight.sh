#!/bin/sh
fighting=1
playerHealth=
## Entity Health
enemyHealth=$()
enemyMax=

## Enemy Name
enemy=Thing

## Monster Attack Strength
mAttk=20

## Player Health
playerMax=100

# Player Attack Strength
attk=25

# Main loop
while [ True ]
do

monsterAttk() {
    echo $enemy attacked $username and dealt $mAttk damage!
    sleep 2

    playerHealth=$(expr $playerHealth - $mAttk)
    sed -i '$s/}/,\n"health":"'$playerHealth'"}/' data/playerStats.json

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