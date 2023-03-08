#!/bin/sh
pwd
playerGold=$(cat data/playerGold.dat)

# Get prices!
stickPrice=$(cat data/weapons/stick/weaponPrice.dat)
bucketPrice=$(cat data/weapons/bucket/weaponPrice.dat)
microphonePrice=$(cat data/weapons/microphone/weaponPrice.dat)
swordPrice=$(cat data/weapons/sword/weaponPrice.dat)

clear
pwd
echo -=-=-=-=-===============-=-=-=-=-
echo \ \ \ \ \ \ \ \ \ \ \ Weapon Shop
echo -=-=-=-=-===============-=-=-=-=-
echo
echo 1. Stick - $stickPrice
echo 2. Bucket - $bucketPrice
echo 3. Microphone - $microphonePrice
echo 4. Sword - $swordPrice
echo
read -p "$ " weaponBuy
if [[ $weaponBuy == "1" ]]
then
    echo
    echo Bought Stick for FREE!
    subGold=$(expr $playerGold - $stickPrice)
    echo $subGold > data/playerGold.dat
    echo - $stickPrice gold
    echo yup > data/weapons/stick/owned.dat
    sleep 3
fi

if [[ $weaponBuy == "2" ]]
then
    echo
    echo Bought Bucket for $bucketPrice
    subGold=$(expr $playerGold - $bucketPrice)
    echo $subGold > data/playerGold.dat
    echo - $bucketPrice gold
    echo yup > data/weapons/bucket/owned.dat
    sleep 3
fi

if [[ $weaponBuy == "3" ]]
then
    echo
    echo Bought Microphone for $microphonePrice
    subGold=$(expr $playerGold - $microphonePrice)
    echo $subGold > data/playerGold.dat
    echo - $microphonePrice gold
    echo yup > data/weapons/microphone/owned.dat
    sleep 3
fi

if [[ $weaponBuy == "4" ]]
then
    echo
    echo Bought Sword for $swordPrice
    subGold=$(expr $playerGold - $swordPrice)
    echo $subGold > data/playerGold.dat
    echo - $swordPrice gold
    echo yup > data/weapons/sword/owned.dat
    sleep 3
fi