#!/bin/sh
health=$(jq -r .health playerStats.json)
addedHealth=$(expr $health + 25)
echo "{\"health\": \"$addedHealth\"}" > data/playerStats.json
