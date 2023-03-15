#!/bin/bash
mod01=$(cat mods/modList/mod01.dat)
mod02=$(cat mods/modList/mod02.dat)
mod03=$(cat mods/modList/mod03.dat)
mod04=$(cat mods/modList/mod04.dat)
weapon1Attack=$(cat data/weapons/stick/weaponAttack.dat)
weapon2Attack=$(cat data/weapons/bucket/weaponAttack.dat)
weapon3Attack=$(cat data/weapons/sword/weaponAttack.dat)
weapon4Attack=$(cat data/weapons/microphone/weaponAttack.dat)

modWeapon1Attack=$(cat data/weapons/$mod01/weaponAttack.dat)
modWeapon2Attack=$(cat data/weapons/$mod02/weaponAttack.dat)
modWeapon3Attack=$(cat data/weapons/$mod03/weaponAttack.dat)
modWeapon4Attack=$(cat data/weapons/$mod04/weaponAttack.dat)
fetchWeapons() {
    weaponSlot1=$(cat data/weapons/stick/weaponName.dat)
    weaponSlot1Ownership=$(cat data/weapons/stick/owned.dat)

    weaponSlot2=$(cat data/weapons/bucket/weaponName.dat)
    weaponSlot2Ownership=$(cat data/weapons/bucket/owned.dat)

    weaponSlot3=$(cat data/weapons/sword/weaponName.dat)
    weaponSlot3Ownership=$(cat data/weapons/sword/owned.dat)

    weaponSlot4=$(cat data/weapons/microphone/weaponName.dat)
    weaponSlot4Ownership=$(cat data/weapons/microphone/owned.dat)


    modWeaponSlot1=$(cat data/weapons/$mod01/weaponName.dat)
    modWeaponSlot1Ownership=$(cat data/weapons/$mod01/owned.dat)

    modWeaponSlot2=$(cat data/weapons/$mod02/weaponName.dat)
    modWeaponSlot2Ownership=$(cat data/weapons/$mod02/owned.dat)

    modWeaponSlot3=$(cat data/weapons/$mod03/weaponName.dat)
    modWeaponSlot3Ownership=$(cat data/weapons/$mod03/owned.dat)

    modWeaponSlot4=$(cat data/weapons/$mod04/weaponName.dat)
    modWeaponSlot4Ownership=$(cat data/weapons/$mod04/owned.dat)

    weaponSlot0=$(cat data/weapons/oopsieBlade/weaponName.dat)
    weaponSlot0Ownership=$(cat data/weapons/oopsieBlade/owned.dat)

    activeWeapon=$(cat data/weapons/activeWeapon.dat)
}
weaponSlot1Description=$(cat data/weapons/stick/weaponDescription.dat)
weaponSlot2Description=$(cat data/weapons/bucket/weaponDescription.dat)
weaponSlot3Description=$(cat data/weapons/sword/weaponDescription.dat)
weaponSlot4Description=$(cat data/weapons/microphone/weaponDescription.dat)

modWeaponSlot1Description=$(cat data/weapons/$mod01/weaponDescription.dat)
modWeaponSlot2Description=$(cat data/weapons/$mod02/weaponDescription.dat)
modWeaponSlot3Description=$(cat data/weapons/$mod03/weaponDescription.dat)
modWeaponSlot4Description=$(cat data/weapons/$mod04/weaponDescription.dat)


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
    if [[ mod01 != "" || mod02 != "" || mod03 != "" || mod04 != "" ]]
    then 
        echo 1 > mods/modsEnabled.dat
    fi
    if [[ mod01 == "" || mod02 == "" || mod03 == "" || mod04 == "" ]]
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

    if [[ $changeWeapon == "inspect" ]]
    then
        echo 
        echo Which weapon do you want to inspect?
        echo 
        if [[ $weaponSlot1Ownership == yup ]]
        then
            echo 1. $weaponSlot1
        fi
        if [[ $weaponSlot1Ownership == nope ]]
        then
            echo 1. Nothing
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
            echo 4. Nothing
        fi

        if [[ $weaponSlot4Ownership == yup ]]
        then
            echo 4. $weaponSlot4
        fi
        if [[ $weaponSlot4Ownership == nope ]]
        then
            echo 4. Nothing
        fi

        if [[ $modsEnabled == 1 ]]
        then
            echo
            echo m1: $mod01
            echo m2: $mod02
            echo m3: $mod03
            echo m4: $mod04
        fi    
        echo
        read -p "> " inspectWeapon
        
        if [[ $inspectWeapon == $weaponSlot1 || $inspectWeapon == "1" ]]
        then
            clear
            echo Weapon: $weaponSlot1
            echo Attack: $weapon1Attack
            echo 
            echo Description: $weaponSlot1Description
            read -p "> "
        fi

        if [[ $inspectWeapon == $weaponSlot2 || $inspectWeapon == "2" ]]
        then
            clear
            echo Weapon: $weaponSlot2
            echo Attack: $weapon2Attack
            echo 
            echo Description: $weaponSlot2Description

            read -p "> "
        fi

        if [[ $inspectWeapon == $weaponSlot3 || $inspectWeapon == "3" ]]
        then
            clear
            echo Weapon: $weaponSlot3
            echo Attack: $weapon3Attack
            echo 
            echo Description: $weaponSlot3Description
            read -p "> "
        fi

        if [[ $inspectWeapon == $weaponSlot4 || $inspectWeapon == "4" ]]
        then
            clear
            echo Weapon: $weaponSlot4
            echo Attack: $weapon4Attack
            echo 
            echo Description: $weaponSlot4Description
            read -p "> "
        fi


        if [[ $inspectWeapon == $mod01 || $inspectWeapon == "m1" ]]
        then
            clear
            echo Weapon: $modWeaponSlot1
            echo Attack: $modWeapon1Attack
            echo 
            echo Description: $modWeaponSlot1Description
            read -p "> "
        fi

        if [[ $inspectWeapon == $mod02 || $inspectWeapon == "m2" ]]
        then
            clear
            echo Weapon: $modWeaponSlot2
            echo Attack: $modWeapon2Attack
            echo 
            echo Description: $modWeaponSlot2Description

            read -p "> "
        fi

        if [[ $inspectWeapon == $mod03 || $inspectWeapon == "m3" ]]
        then
            clear
            echo Weapon: $modWeaponSlot3
            echo Attack: $modWeapon3Attack
            echo 
            echo Description: $modWeaponSlot3Description
            read -p "> "
        fi

        if [[ $inspectWeapon == $mod04 || $inspectWeapon == "m4" ]]
        then
            clear
            echo Weapon: $modWeaponSlot4
            echo Attack: $modWeapon4Attack
            echo 
            echo Description: $modWeaponSlot4Description
            read -p "> "
        fi
    fi

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