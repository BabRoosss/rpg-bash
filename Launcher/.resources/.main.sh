#!/bin/sh
fetch() {
    activeWeapon=$(cat data/weapons/activeWeapon.dat)
    attk=$(cat data/weapons/$activeWeapon/weaponAttack.dat)
    errorCheck=$(cat errorHandling/errorCheckStatus.dat)
    playerHealth=$(cat data/playerHealth.dat)
    playerMaxHealth=$(cat data/playerMaxHealth.dat)
    gold=$(cat data/playerGold.dat)
    username=$(cat data/playerName.dat)
    inv1=$(cat data/playerInventory.dat)
    debug=$(cat data/debug.dat)
}

fetch

# Check if there are invalid variables
if [[ $errorCheck != "checked" ]]
then
    echo notChecked > errorHandling/errorCheckStatus.dat
    bash .errorHandler.sh
else
    sleep 1
fi



# Check if debug mode is enabled
if [[ $debug == debug ]]
then
    echo Debug mode enabled
    sleep 1
else
    echo
fi

# Initiate error check
echo 1 > errorHandling/error.dat
echo  > errorHandling/errorMessage.dat


if [[ $username == "" ]]
then
    username="Player"
    echo Username: Player > data/playerName.dat
else
    echo
fi

## INIT ERROR HANDELING VARIABLE
error="1"

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
    fetch
    
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
    echo $username 
    echo $playerHealth/$playerMaxHealth
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

    if [[ $playerHealth == "ERROR" || $xp == "ERROR" || $gold == "ERROR" || $attk == "ERROR" ]]
    then
        echo ERROR, ESSENTIAL VALUE IS MISSING!
        echo
        echo -e '\e[1A\e[KExiting to menu'
        sleep 1
        echo -e '\e[1A\e[KExiting to menu .'
        sleep 1
        echo -e '\e[1A\e[KExiting to menu . .'
        sleep 1
        echo -e '\e[1A\e[KExiting to menu . . .' 
        bash ../main.sh
    else
        read -p "> " mainChoice
    fi

    if [[ $mainChoice == "1" ]]
    then

        # Random encounter handler.
        randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
        if [[ $randEncounter == 1 ]]
        then
            monsterEncounter=$(python -S -c "import random; print(random.randrange(1,6))")
            echo $monsterEncounter > data/monsterSelected.dat
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
            clear
            # casino elf
            echo You encounter an elf. He offers to let you put 5 gold in for a chance to double it. 
            echo If the dice is not in your favour, you will lose 10 gold. Do you accept?

            read -p "[Y/n]>> " casinoChoice
            if [[ $casinoChoice == "Y" || $casinoChoice == "y" || $casinoChoice == "" ]]
            then
                bash .casino.sh
            elif [[ $casinoChoice == "N" || $casinoChoice == "n" ]]
            then
                echo
            else
                echo Please enter a valid option
            fi
            
            sleep 1
        fi
        if [[ $randEncounter == 9 ]]
        then
            monsterEncounter=$(python -S -c "import random; print(random.randrange(1,6))")
            echo $monsterEncounter > data/monsterSelected.dat
            bash .fight.sh
        fi
        if [[ $randEncounter == 10 ]]
        then
            hardMode=$(cat data/HardMode.dat)

            if [[ $hardMode == "hard" ]]
            then
                echo satan > data/monsterSelected.dat
                bash fight.sh
            elif [[ $hardMode == "dave" ]]
            then
                echo dave > data/monsterSelected.dat
                bash fight.sh
            else
                echo You find a sealed door in the woods.
                echo It is locked.
                sleep 3
            fi
            sleep 1
        fi
    fi

    if [[ $mainChoice == "2" ]]
    then
        # Open inventory
        bash .inventory.sh
    fi

    if [[ $mainChoice == "3" ]]
    then
        # Player dies
        lose
    fi

    if [[ $mainChoice == "4" ]]
    then
        # Exit
        echo not checked > errorHandling/errorCheckStatus.dat
        echo allGood > errorHandling/error.dat
        cd ..
        bash main.sh
    fi

    if [[ $mainChoice == "reload" && debug == "debug" ]]
    then
        # Reset the game //DEBUG FUNCTION
        echo not checked > errorHandling/errorCheckStatus.dat
        echo allGood > errorHandling/error.dat
        bash start.sh
    fi

    if [[ $mainChoice == "5" && debug == "debug" ]]
    then
        # Open shop // DEBUG FUNCTION
        bash .shop.sh
    fi

    if [[ $mainChoice == "6" && $debug == "debug" ]]
    then
        # +5 gold // DEBUG FUNCTION
        addedGold=$(expr $gold + 5 )
        echo $gold > data/playerGold.dat
    fi

    if [[ $mainChoice == "crash" ]]
    then
        echo Crash Message: User initiated crash. > errorHandling/errorMessage.dat
        exit
    fi 

    if [[ $mainChoice == "fight" ]]
    then
        echo Who do you want to fight?
        read -p "> " fightChoice
        echo $fightChoice > data/monsterSelected.dat
        bash .fight.sh
    fi 
    if [[ $mainChoice == "hot" ]]
    then
        bash .hotSpring.sh
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

# Randomly find gold
foundGold() {
    clear
    additionalMessage="$username found gold!"
    echo You found 10 gold on the ground!
    echo +10 Gold
    addedGold=$(expr $gold + 10)
    echo $addedGold > data/playerGold.dat
    sleep 3
    main
}

# Randomly find XP
xpGain() {
    clear
    xp=$(expr $xp + 15)
    echo You got XP!
    echo +15 XP
    echo $xp > data/playerXp.dat
    sleep 3
    main
}

# Win fight
win() {
    enemy=$(cat "data/monsterData/$monsterChosen/name.dat")
    additionalMessage="$username won a fight against a $enemy"
    echo You won!
    echo > data/monsterSelected.dat
    sleep 5
    xpGain
}

# Lose fight and print death message.
lose() {

    deathMessage=$(cat /data/monsterData/$monsterChosen/playerDeathMessage.dat)
    echo $deathMessage
    sleep 5
    read -p "Press Enter to Exit"
    bash ../main.sh
}

# Main Loop
while [ $alive=1 ]
do
    main
done