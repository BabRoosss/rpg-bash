@echo off
:cls
for /l %x in (1, 1, 100) do echo.


:cls

:main
set deathMessage="username Choked on Air"
echo %additionalMessage%
set additionalMessage=""
::randEncounter=$(python -S -c "import random; print(random.randrange(1,10))")
echo $username: %playerHealth%/%playerMax%
echo XP: %xp%
echo Gold: %gold%
echo Attack: %attk%
echo. 
echo What would you like to do?
echo.
echo 1. Wander
echo 2. Inventory
echo 3. Die i guess
echo 4. Exit
echo.

set /p mainChoice=">"
echo %mainChoice%
if %mainChoice%==1 goto :randEncounter
if %mainChoice%==2 goto :inventory
if %mainChoice%==3 goto :death
if %mainChoice%==4 goto :exit
if %mainChoice%=="reload" echo reloaded

:randEncounter
echo random
pause

:inventory
echo inventory
pause

:death
echo death
pause

:exit
echo exit
pause

goto :LOOP