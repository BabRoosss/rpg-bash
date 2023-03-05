#!/bin/bash

echo checked > errorHandling/errorCheckStatus.dat

playerHealth=$(cat data/health.dat | grep Health: )
gold=$(cat data/gold.dat | grep Gold: )
inv1=$(cat data/inventory.dat | grep Slot 1:)
inv2=$(cat data/inventory.dat | grep Slot 2:)
inv3=$(cat data/inventory.dat | grep Slot 3:)
inv4=$(cat data/inventory.dat | grep Slot 4:)

if [[ $playerHealth == "" ]]
then
    echo ERROR > data/health.dat
fi

if [[ $gold == "" ]]
then
    echo ERROR > data/gold.dat
fi

if [[ $inv1 == "" ]]
then
    echo ERROR > data/inventory.dat
fi

if [[ $inv2 == "" ]]
then
    echo ERROR > data/inventory.dat
fi

if [[ $inv3 == "" ]]
then
    echo ERROR > data/inventory.dat
fi

if [[ $inv4 == "" ]]
then
    echo ERROR > data/inventory.dat
fi

bash .main.sh 