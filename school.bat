echo off

:start
echo.
echo Select an option:
echo ================
echo 1) Create a minecraft server
echo 2) Open chrome windows
echo 3) Coming soon
echo 4) End Program
echo.

@REM Gets the users choice
set choice=
set /p choice=Type option: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :createserver
if '%choice%'=='2' goto :openwindows
if '%choice%'=='4' exit

@REM Checks if it is valid
echo "%choice%" is not valid, try again
echo.
goto :start

:createserver
cls

@REM Set the variable`s for setting up the server 
@REM set /p dir=What should the server be called?: 
set /p name=What should the server be called?: 
set /p ram=How much ram can the server use(Gigabytes)?: 
@REM set /p version=What is the minecraft cersion of the server(Answer like this example 1.19.4)?: 

@REM TODO Figure out how to set a custom directory for the server files.
mkdir %name%
cd %name%
echo java -Xms250M -Xmx%ram%G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui> start.bat
echo eula=true>eula.txt
rm paper.jar
curl https://papermc.io/api/v1/paper/%version%/latest/download --output paper.jar
cls
echo Done
goto start



:openwindows
@REM Opens the usual windows we use.
start https://classroom.google.com/c/
start https://mail.google.com/mail/u/0/
start https://drive.google.com/drive/my-drive
cls
echo Windows opened!
goto start


