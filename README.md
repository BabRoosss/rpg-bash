# rpg-bash v 0.4
Made by Bab Roosss

## How to Play
Run the main.sh file in the Launcher directory.

## Dependancies
- python
- bash

## Known Bugs
None!

## Changelog

### v 0.1
- Started a changelog
- Added propper monster selection
- Revamped data storage
- Added error handling

### v 0.2
- Fixed player not dying when health went below 0
- Fixed errors breifly showing.
- Fixed directory issues when exiting to main menu

### v 0.2.1
- Changed player damage per hit from a static number to the attack per hit of the equiped weapon
- Revamped shop to have 2 sections. (Weapons and Potions)
- Added basic inventory system to manage weapons.
- Made monsters die when health goes below 0
- Fixed super secret boss's attack to now only do the 32-bit integer limit per hit.
- Added 4 weapons.
- Added catalogue for weapons and potion shop

### v 0.3
- Added gambling
- Made sure player couldn't win (or lose) an infinite amount of money
- Implemented potions and inventory for potions
- Fixed broken options option on main menu
- Removed most mentions of json
- Fixed player data remover to also disown all weapons exept for the stick
- Fixed player overhealing from the hot spring

### v 0.3.1
- Added ability to buy potions
- Added stats for potions
- Added "Mods" menu

### v 0.4
- Added mods. Only working type is the weapon mod. Example mod is included.
- Fixed printing win and lose conditions
- "Added" potion shop (still broken)

### v 0.4.1
- Implemented propper weapon mod loading.
- Alowed player to load up to 4 mod weapons
- Modified Inventory to allow player to equip and see modded weapons

### v 0.4.1
- Fixed weapon mod loading
- Fixed casino leaving a null value in the gold counter
- Changed a few messages