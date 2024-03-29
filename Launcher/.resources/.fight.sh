#!/bin/sh

# Player Attack Strength
activeWeapon=$(cat data/weapons/activeWeapon.dat)
attk=$(cat data/weapons/$activeWeapon/weaponAttack.dat)
if [[ $attk == "ERROR" ]]
then
    echo ERROR! WEAPON $activeWeapon ATTACK VALUE MISSING!
    echo USING FALLBACK WEAPON
    sleep 3
    echo oopsieBlade > data/weapons/activeWeapon.dat
    activeWeapon=$(cat data/weapons/activeWeapon.dat)
    attk=$(cat data/weapons/$activeWeapon/weaponAttack.dat)
else
    echo
fi

fighting=1

monsterChosen=$(cat data/monsterSelected.dat)

if [[ $monsterChosen == "" ]]
then
    echo ErrorMonster > data/monsterSelected.dat
    monsterChosen=$(cat data/monsterSelected.dat)
else
    echo
fi

## Entity Health
enemyHealth=$(cat "data/monsterData/$monsterChosen/health.dat")
enemyMax=$(cat "data/monsterData/$monsterChosen/maxHealth.dat")

## Enemy Name
enemy=$(cat "data/monsterData/$monsterChosen/name.dat")

## Monster Attack Strength
mAttk=$(cat "data/monsterData/$monsterChosen/attack.dat")

## Player Health
playerHealth=$(cat data/playerHealth.dat)
playerMax=$(cat data/playerMaxHealth.dat)

# Main loop
while [ True ]
do
    monsterAttk() {
        echo $enemy attacked $username and dealt $mAttk damage!
        sleep 2

        playerHealth=$(expr $playerHealth - $mAttk)
        echo $playerHealth > data/playerHealth.dat
        playerHealth=$(cat data/playerHealth.dat)
        if [[ $playerHealth == 0 ]]
        then
            bash .gameOver.sh
        fi

        if [[ $playerHealth -lt 0 ]]
        then
            bash .gameOver.sh
        fi
    }
    clear
    deathMessage=$(cat data/monsterData/$monsterChosen/playerDeathMessage.dat)
    if [[ $enemyHealth == 0 ]]
    then
        additionalMessage="$username killed $enemy"
        bash .win.sh 
    fi
    if [[ $enemyHealth -lt 0 ]]
    then
        additionalMessage="$username killed $enemy"
        bash .win.sh 
    fi
    if [[ $playerHealth == 0 ]]
    then
        bash .gameOver.sh
    fi

    if [[ $playerHealth -lt 0 ]]
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
        echo  > data/monsterSelected.dat
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
        bash .win.sh 
    fi
    if [[ $enemyHealth -lt 0 ]]
    then
        additionalMessage="$username killed $enemy"
        bash .win.sh 

    fi
    if [[ $playerHealth == 0 ]]
    then
        bash .gameOver.sh
    fi

    if [[ $playerHealth -lt 0 ]]
    then
        bash .gameOver.sh
    fi

    monsterAttk
    clear
done