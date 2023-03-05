#!/bin/sh
# Get health and add it.
health=$(cat data/playerHealth.dat)
addedHealth=$(expr $health + 25)
echo $addedHealth > data/playerHealth.dat