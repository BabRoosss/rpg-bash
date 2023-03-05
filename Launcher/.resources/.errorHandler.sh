#!/bin/bash

echo checked > errorHandling/errorCheckStatus.dat

playerHealth=$(cat data/playerHealth.dat)
gold=$(cat data/playerGold.dat)
inv1=$(cat data/playerInventory.dat | grep Slot 1:)
inv2=$(cat data/playerInventory.dat | grep Slot 2:)
inv3=$(cat data/playerInventory.dat | grep Slot 3:)
inv4=$(cat data/playerInventory.dat | grep Slot 4:)

if [[ $playerHealth == "" ]]
then
    echo ERROR > data/playerHealth.dat
fi

if [[ $gold == "" ]]
then
    echo ERROR > data/playerGold.dat
fi

if [[ $inv1 == "" ]]
then
    echo ERROR > data/playerInventory.dat
fi

if [[ $inv2 == "" ]]
then
    echo ERROR > data/playerInventory.dat
fi

if [[ $inv3 == "" ]]
then
    echo ERROR > data/playerInventory.dat
fi

if [[ $inv4 == "" ]]
then
    echo ERROR > data/playerInventory.dat
fi

bash .main.sh 