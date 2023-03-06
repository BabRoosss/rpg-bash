#!/bin/bash

echo checked > errorHandling/errorCheckStatus.dat

playerHealth=$(cat data/playerHealth.dat)
gold=$(cat data/playerGold.dat)


if [[ $playerHealth == "" ]]
then
    echo ERROR > data/playerHealth.dat
fi

if [[ $gold == "" ]]
then
    echo ERROR > data/playerGold.dat
fi

bash .main.sh