#!/bin/sh

# Check if debug mode is enabled
cat data/debug.dat | grep debug
read
if [[  ]]

cd .resources
clear
## FIND PLAYER STATS

playerHealth=$(cat data/health.dat | grep Health: )
gold=$(cat data/gold.dat | grep Gold: )
username=$(cat data/username.dat | grep Username:)

## FETCH INVENTORY
inv4=$(cat data/inventory.dat | grep Slot 1:)
inv4=$(cat data/inventory.dat | grep Slot 2:)
inv4=$(cat data/inventory.dat | grep Slot 3:)
inv4=$(cat data/inventory.dat | grep Slot 4:)

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
    echo Username: Player > data/username.dat
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
    ## FETCH INVENTORY & HEALTH
    playerHealth=$(cat data/health.dat | grep Health: )
    gold=$(cat data/gold.dat | grep Gold: )
    username=$(cat data/username.dat | grep Username:)
    inv1=$(cat data/inventory.dat | grep Slot 1:)
    inv2=$(cat data/inventory.dat | grep Slot 2:)
    inv3=$(cat data/inventory.dat | grep Slot 3:)
    inv4=$(cat data/inventory.dat | grep Slot 4:)

    # Make sure player isnt dead
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

    # Set default death message
    deathMessage="$username Choked on Air"
    clear

    # Obsolete?
    echo $additionalMessage

    # Select random number for random encounter
    randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")

    # Player stats
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

        # Random encounter handler.
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
            # casino elf
            echo You encounter an elf. He offers to let you put 5 gold in for a chance to double it. 
            echo If the dice is not in your favour, you will lose 10 gold. Do you accept?

            
            sleep 1
        fi
        if [[ $randEncounter == 9 ]]
        then
            bash .fight.sh
        fi
        if [[ $randEncounter == 10 ]]
        then
            # add the devil
            # STATS:
            # name: destroyer of the plane of existence
            # health: ?/?
            # attack: a lot
            echo 10
            sleep 1
        fi
    fi

    if [[ $mainChoice == "2" ]]
    then
        # Open inventory
        inventory
    fi

    if [[ $mainChoice == "3" ]]
    then
        # Player dies
        lose
    fi

    if [[ $mainChoice == "4" ]]
    then
        # Exit
        error="no error"
        bash ../main.sh
    fi

    if [[ $mainChoice == "reload" && debug == "enabled" ]]
    then
        # Reset the game //DEBUG FUNCTION
        bash start.sh
    fi

    if [[ $mainChoice == "5" && debug == "enabled" ]]
    then
        # Open shop // DEBUG FUNCTION
        bash .shop.sh
    fi

    if [[ $mainChoice == "6" && debug == "enabled"]]
    then
        # +5 gold // DEBUG FUNCTION
        addedGold=$(expr $gold + 5 )
        playerHealth=$(cat data/health.dat | grep Health: )
        gold=$(cat data/gold.dat | grep Gold: )
    fi
}

## INVENTORY MANAGER // TODO: IMPLEMENT PROPPER INVENTORY MANAGER
inventory() {
    echo Inventory Slots
    echo 1. $inv1
    echo 2. $inv2
    echo 3. $inv3
    echo 4. $inv4
    read -p ">> " inv
}

# Randomly find gold
foundGold() {
    clear
    additionalMessage="$username found gold!"
    echo You found 10 gold on the ground!
    echo +10 Gold
    addedGold=$(expr $gold + 10)
    echo $addedGold > data/gold.dat
    sleep 3
    main
}

# Randomly find XP
xpGain() {
    clear
    xp=$(expr $xp + 15)
    echo You got XP!
    echo +15 XP
    echo $xp > data/xp.dat
    sleep 3
    main
}

# Win fight
win() {
    additionalMessage="$username won a fight against a $enemy"
    echo You won!
    sleep 5
    xpGain
}

# Lose fight and print death message.
lose() {
    echo $deathMessage
    sleep 5
    read -p "Press Enter to Exit"
    exit
}

# Main Loop
while [ $alive=1 ]
do
    main
done

