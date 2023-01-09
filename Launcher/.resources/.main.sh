#!/bin/sh
cd .resources
clear
## FIND PLAYER STATS

playerHealth=$(jq -r .health data/playerStats.json)
gold=$(jq -r .gold data/playerStats.json)
username=$(jq -r .username data/username.json)

## FETCH INVENTORY
inv1=$(jq -r .inv1 data/inventory.json)
inv2=$(jq -r .inv2 data/inventory.json)
inv3=$(jq -r .inv3 data/inventory.json)
inv4=$(jq -r .inv4 data/inventory.json)

## CHECK IF NEW PLAYER OF RECENTLY DELETED SAVE

if [[ $playerHealth == "" ]]
then
    data/playerStatsTemplate.dat > data/playerStats.json
else
    echo
fi

if [[ $username == "" ]]
then
    username="Player"
    echo {\"username\": \"Player\"} > data/username.json
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

## MAIN GAME LOOP

main() {
    ## FETCH INVENTORY
    inv1=$(jq -r .inv1 data/inventory.json)
    inv2=$(jq -r .inv2 data/inventory.json)
    inv3=$(jq -r .inv3 data/inventory.json)
    inv4=$(jq -r .inv4 data/inventory.json)
    playerHealth=$(jq -r .health data/playerStats.json)


    if [[ $playerHealth == 0 ]]
    then
        bash .gameOver.sh
    fi
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
    additionalMessage=""
    randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
    echo $username: $playerHealth/$playerMax
    echo XP: $xp
    echo Gold: $gold
    echo Attack: $attk
    echo 
    echo What would you like to do?
    echo
    echo 1. Wander
    echo 2. Inventory
    echo 3. Die i guess
    echo 4. Exit
    echo 
    read -p "> " mainChoice

    if [[ $mainChoice == "1" ]]
    then
        randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
        if [[ $randEncounter == 1 ]]
        then
            bash .fight.sh
        fi
        if [[ $randEncounter == 2 ]]
        then
            xpGain
        fi
        if [[ $randEncounter == 3 ]]
        then
            bash .shop.sh
        fi
        if [[ $randEncounter == 4 ]]
        then
            bash .hotSpring.sh
        fi
        if [[ $randEncounter == 5 ]]
        then
            foundGold
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
        bash ../main.sh
    fi
    if [[ $mainChoice == "reload" ]]
    then
        bash start.sh
    fi
    if [[ $mainChoice == "5" ]]
    then
        bash .shop.sh
    fi
    if [[ $mainChoice == "6" ]]
    then
        addedGold=$(expr $gold + 5 )
        jq '.location="$addedGold"' data/playerStats.json
    fi
}

## INVENTORY MANAGER

inventory() {
    echo Inventory Slots
    echo 1. $inv1
    echo 2. $inv2
    echo 3. $inv3
    echo 4. $inv4
    read -p ">> " inv
}

foundGold() {
    clear
    additionalMessage="$username found gold!"
    echo You found 10 gold on the ground!
    echo +10 Gold
    addedGold=$(expr $gold + 10)
    sed -i '$s/}/,\n"gold":"'$addedGold'"}/' data/playerStats.json
    sleep 3
    main
}

xpGain() {
    clear
    additionalMessage="$username found XP"
    xp=$(expr $xp + 15)
    echo You got XP!
    echo +15 XP
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

#fight() {
#    
#}

while [ $alive=1 ]
do
    main
done

