#!/bin/bash
cd .resources

while [ 1==1 ]
do
    modList=$(cat mods/modList.dat)
    if [[ $modList == "" ]]
    then
        touch mods/modList.dat
        echo None > mods/modList.dat
        modList=$(cat mods/modList.dat)
    fi
    
    mod01=$(cat mods/modList/mod01.dat)
    mod02=$(cat mods/modList/mod02.dat)
    mod03=$(cat mods/modList/mod03.dat)
    mod04=$(cat mods/modList/mod04.dat)
    
    echo Mods
    echo
    echo Active Mods:
    echo Mod01: $mod01
    echo Mod02: $mod02
    echo Mod03: $mod03
    echo Mod04: $mod04
    echo
    echo Type enable to enable a mod
    echo Type disable to disable a mod
    echo Type "list" to list all mods.
    echo Type exit to leave
    read -p "> " modEnable

    modStatus=$(cat mods/$modEnable/enabled.dat)
    if [[ $modEnable == "exit" ]]
    then
        cd ..
        bash main.sh
    fi
    if [[ $modEnable == "disable" ]]
    then
        
        echo What mod do you want to disable?
        read -p ">" modEnable
        modStatus=$(cat mods/$modEnable/enabled.dat)
        modTypeDirectory=$(cat mods/$modEnable/type.dat)
        echo no > mods/$modEnable/enabled.dat
        rm -rf data/$modTypeDirectory/$modEnable
        echo Mod "$modEnable" turned off
        activeWeapon=$(cat data/weapons/activeWeapon.dat)

        if [[ $mod01 == $modEnable ]]
        then
            echo  > mods/modList/mod01.dat
            sleep 3
        fi
        if [[ $mod02 == $modEnable ]]
        then
            echo  > mods/modList/mod02.dat
            sleep 3
        fi
        if [[ $mod03 == $modEnable ]]
        then
            echo  > mods/modList/mod03.dat
            sleep 3
        fi
        if [[ $mod04 == $modEnable ]]
        then
            echo  > mods/modList/mod04.dat
            sleep 3
        fi
        if [[ $modEnable == $activeWeapon ]]
        then
            echo stick > data/weapons/activeWeapon.dat
        fi
        mod01=$(cat mods/modList/mod01.dat)
        mod02=$(cat mods/modList/mod02.dat)
        mod03=$(cat mods/modList/mod03.dat)
        mod04=$(cat mods/modList/mod04.dat)
    fi
    if [[ $modEnable == "enable" ]]
    then
        echo What mod do you want to enable?
        read -p "> " modEnable
        echo
        echo What slot do you want to load it in?
        read -p "> " modSlot
        echo yes > mods/$modEnable/enable.dat
        modType=$(cat mods/$modEnable/type.dat)
        if [[ $modType == "weapons" ]]
        then
            modTypeDirectory="weapons"
        fi
        if [[ $modType == "potion" ]]
        then
            modTypeDirectory="potions"
        fi
        if [[ $modType == "monster" ]]
        then
            modTypeDirectory="monsterData"
        fi
        if [[ $modType == "" ]]
        then
            ERROR: MOD TYPE NOT SET OR UNKNOWN > mods/$modEnable/type.dat
            echo ERROR: CHECK MOD TYPE FILE FOR DETAILS
        fi
        cp -fR mods/$modEnable/data data/$modTypeDirectory/$modEnable

        #manual slot loading
        echo $modEnable > mods/modList/$modSlot.dat
    fi
    
    if [[ $modEnable == "list" ]]
    then
        cd mods
        pwd
        tree -d -L 1
        sleep 3
        echo 
        read -p "Press Enter to Exit . . . "
        cd ..
    fi
done