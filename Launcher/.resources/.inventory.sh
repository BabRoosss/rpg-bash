#!/bin/bash
fetchWeapons() {
    weaponSlot1=$(cat data/weapons/stick/weaponName.dat)
    weaponSlot1Ownership=$(cat data/weapons/stick/owned.dat)

    weaponSlot2=$(cat data/weapons/bucket/weaponName.dat)
    weaponSlot2Ownership=$(cat data/weapons/bucket/owned.dat)

    weaponSlot3=$(cat data/weapons/sword/weaponName.dat)
    weaponSlot3Ownership=$(cat data/weapons/sword/owned.dat)

    weaponSlot4=$(cat data/weapons/microphone/weaponName.dat)
    weaponSlot4Ownership=$(cat data/weapons/microphone/owned.dat)

    weaponSlot0=$(cat data/weapons/oopsieBlade/weaponName.dat)
    weaponSlot0Ownership=$(cat data/weapons/oopsieBlade/owned.dat)

    activeWeapon=$(cat data/weapons/activeWeapon.dat)
}

InventoryWeapons() {
    fetchWeapons
    clear
    echo -=-=-=-=-=============-=-=-=-=-
    echo \ \ \ \ \ \ \ \ \ \ \ Inventory
    echo -=-=-=-=-=============-=-=-=-=-    
    echo 
    echo Weapons:
    if [[ $weaponSlot1Ownership == yup ]]
    then
        echo 1. $weaponSlot1
    fi
    if [[ $weaponSlot1Ownership == nope ]]
    then
        echo 4. Nothing
    fi

    if [[ $weaponSlot2Ownership == yup ]]   
    then
        echo 2. $weaponSlot2
    fi
    if [[ $weaponSlot2Ownership == nope ]]
    then
        echo 2. Nothing
    fi

    if [[ $weaponSlot3Ownership == yup ]]
    then
        echo 3. $weaponSlot3
    fi
    if [[ $weaponSlot3Ownership == nope ]]
    then
        echo 3. Nothing
    fi

    if [[ $weaponSlot4Ownership == yup ]]
    then
        echo 4. $weaponSlot4
    fi
    if [[ $weaponSlot4Ownership == nope ]]
    then
        echo 4. Nothing
    fi
    echo 
    echo $activeWeapon
    echo
    read -p "> " changeWeapon

    if [[ $changeWeapon == 1 && $weaponSlot1Ownership == "yup" ]]
    then
        echo stick > data/weapons/activeWeapon.dat
    fi  

    if [[ $changeWeapon == 2 && $weaponSlot2Ownership == "yup" ]]
    then
        echo bucket > data/weapons/activeWeapon.dat
    fi
    if [[ $changeWeapon == 2 && $weaponSlot2Ownership == "nope" ]]
    then
        echo You don\'t own a bucket!
        sleep 3
        InventoryWeapons
    fi

    if [[ $changeWeapon == 3 && $weaponSlot3Ownership == "yup" ]]
    then
        echo sword > data/weapons/activeWeapon.dat
    fi
    if [[ $changeWeapon == 3 && $weaponSlot3Ownership == "nope" ]]
    then
        echo You don\'t own a sword!
        sleep 3
        InventoryWeapons
    fi

    if [[ $changeWeapon == 4 && $weaponSlot4Ownership == "yup" ]]
    then
        echo microphone > data/weapons/activeWeapon.dat
    fi
    if [[ $changeWeapon == 4 && $weaponSlot4Ownership == "nope" ]]
    then
        echo You don\'t own a microphone!
        sleep 3
        InventoryWeapons
    fi
    
    if [[ $changeWeapon == "exit" ]]
    then
        bash .main.sh
    fi
}

InventoryWeapons