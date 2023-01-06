#!/bin/sh
## MAIN GAME CODE
alive=1
enemyHealth=50
enemyMax=50
attk=25
enemy=Thing
## FUNCTIONS
main() {
    echo AHHHHH
    sleep 0.1
    clear
    fight
}

win() {
    echo You won!
    sleep 5
    main
}

fight() {

    if [[ $enemyHealth == 0 ]]
    then
        win
    fi
    echo Enemy $enemy appears!
    echo $enemy $enemyHealth/$enemyMax
    echo 1-Attack 2-Flee
    read -p ":: " choice


    if [[ $choice == "1" ]]
    then
        echo You attacked $enemy and dealt $attk damage!
        sleep 2
        enemyHealth=$(expr $enemyHealth - $attk)
    fi
    if [[ $choice == "2" ]]
    then
        echo You ran away!
        win
    fi

    clear
}

while [ $alive="1" ]
do
    main
done