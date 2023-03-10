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

    mod01=$(cat mods/modList/mod01.dat)
    mod02=$(cat mods/modList/mod02.dat)
    mod03=$(cat mods/modList/mod03.dat)
    mod04=$(cat mods/modList/mod04.dat)
    if [[ mod01 != " " || mod02 != " " || mod03 != " " || mod04 != " " ]]
    then 
        echo 1 > mods/modsEnabled.dat
    fi
    if [[ mod01 == " " || mod02 == " " || mod03 == " " || mod04 == " " ]]
    then 
        echo 0 > mods/modsEnabled.dat
    fi
    modsEnabled=$(cat mods/modsEnabled.dat)

    if [[ $modsEnabled == 1 ]]
    then
        echo
        echo m1: $mod01
        echo m2: $mod02
        echo m3: $mod03
        echo m4: $mod04
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
    mod01=$(cat mods/modList/mod01.dat)
    mod02=$(cat mods/modList/mod02.dat)
    mod03=$(cat mods/modList/mod03.dat)
    mod04=$(cat mods/modList/mod04.dat)

    if [[ $changeWeapon == m1 ]]
    then
        if [[ $mod01 == "Nothing" ]]
        then
            echo No mod loaded in this slot!
            sleep 3
        fi
        if [[ $mod01 != "" ]]
        then
            echo Equipped $mod01
            modWeapon=$(cat mods/modList/mod01.dat)
            echo $modWeapon > data/weapons/activeWeapon.dat
            sleep 3
        else
            echo No mod present!
            sleep 3
        fi
    fi
    if [[ $changeWeapon == m2 ]]
    then
        if [[ $mod02 == "Nothing" ]]
        then
            echo No mod loaded in this slot!
            sleep 3
        fi
        if [[ $mod02 != "" ]]
        then
            echo Equipped $mod02
            modWeapon=$(cat mods/modList/mod02.dat)
            echo $modWeapon > data/weapons/activeWeapon.dat
            sleep 3
        else
            echo No mod present!
            sleep 3
        fi
    fi
    if [[ $changeWeapon == m3 ]]
    then
        if [[ $mod03 == "Nothing" ]]
        then
            echo No mod loaded in this slot!
            sleep 3
        fi
        if [[ $mod03 != "" ]]
        then
            echo Equipped $mod03
            modWeapon=$(cat mods/modList/mod03.dat)
            echo $modWeapon > data/weapons/activeWeapon.dat
            sleep 3
        else
            echo No mod present!
            sleep 3
        fi
    fi
    if [[ $changeWeapon == m4 ]]
    then
        if [[ $mod04 == "Nothing" ]]
        then
            echo No mod loaded in this slot!
            sleep 3
        fi
        if [[ $mod04 != "" ]]
        then
            echo Equipped $mod04
            modWeapon=$(cat mods/modList/mod04.dat)
            echo $modWeapon > data/weapons/activeWeapon.dat
            sleep 3
        else
            echo No mod present!
            sleep 3
        fi
    fi

    if [[ $changeWeapon == "exit" ]]
    then
        bash .main.sh
    fi
}

while [ 1==1 ]
do
    InventoryWeapons
done