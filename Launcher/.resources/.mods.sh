#!/bin/bash
while [ 1==1 ]
do
    modList=$(cat mods/modList.dat)
    if [[ $modList == "" ]]
    then
        touch mods/modList.dat
        echo None > mods/modList.dat
        modList=$(cat mods/modList.dat)
    fi
    
    echo Mods
    echo
    echo type the folder name of the mod to toggle its state
    read -p "> " modEnable

    modStatus=$(cat mods/$modEnable/enabled.dat)
    if [[ $modEnable == "exit" ]]
    then
        cd ..
        bash main.sh
    else
        modStatus=$(cat mods/$modEnable/enabled.dat)
        if [[ $modStatus == "yes" ]]
        then
            echo no > mods/$modEnable/enabled.dat
            rm -fr data/$modTypeDirectory/$modEnable
            echo Mod "$modEnable" turned off
            sleep 3
        fi

        if [[ $modStatus == "no" ]]
        then
            echo yes > mods/$modEnable/enable.dat
            modType=$(cat mods/$modEnable/type.dat)
            if [[ $modType == "weapon" ]]
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
            echo Mod "$modEnable" turned on
            sleep 3
        fi
    fi
done