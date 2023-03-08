#!/bin/sh
echo -=-=-=-=-===============-=-=-=-=-
echo \ \ \ \ \ \ \ \ \ \ \ Potion Shop
echo -=-=-=-=-===============-=-=-=-=-

pwd
playerGold=$(cat data/playerGold.dat)

# Get prices!
healthPrice=$(cat data/potions/health/potionPrice.dat)
strenghtPrice=$(cat data/potions/strenght/potionPrice.dat)
invisibilityPrice=$(cat data/potions/invisibility/potionPrice.dat)
harmingPrice=$(cat data/potions/harming/potionPrice.dat)

clear
echo -=-=-=-=-===============-=-=-=-=-
echo \ \ \ \ \ \ \ \ \ \ \ Potion Shop
echo -=-=-=-=-===============-=-=-=-=-
echo
echo 1. Health Potion - $healthPrice
echo 2. Strength Potion - $strengthPrice
echo 3. Invisibility - $invisibilityPrice
echo 4. Potion of Harming - $harmingPrice
echo
read -p "$ " potionBuy
if [[ $potionBuy == "1" ]]
then
    echo
    echo Bought a Potion of Healing for $healthPrice
    subGold=$(expr $playerGold - $healthPrice)
    echo $subGold > data/playerGold.dat
    echo - $healthPrice gold
    echo yup > data/potions/health/owned.dat
    sleep 3
fi

if [[ $weaponBuy == "2" ]]
then
    echo
    echo Bought Potion of Strength for $strenghtPrice
    subGold=$(expr $playerGold - $strenghtPrice)
    echo $subGold > data/playerGold.dat
    echo - $strenghtPrice gold
    echo yup > data/potions/strenght/owned.dat
    sleep 3
fi

if [[ $weaponBuy == "3" ]]
then
    echo
    echo Bought Potion of Invisibility for $invisibilityPrice
    subGold=$(expr $playerGold - $microphonePrice)
    echo $subGold > data/playerGold.dat
    echo - $invisibilityPrice gold
    echo yup > data/potions/invisibility/owned.dat
    sleep 3
fi

if [[ $potionBuy == "4" ]]
then
    echo
    echo Bought Potion of Harming for $harmingPrice
    subGold=$(expr $playerGold - $harmingPrice)
    echo $subGold > data/playerGold.dat
    echo - $harmingPrice gold
    echo yup > data/potions/harming/owned.dat
    sleep 3
fi