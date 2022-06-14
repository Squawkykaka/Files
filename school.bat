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

set choice=
set /p choice=Type option: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :createserver
if '%choice%'=='2' goto :openwindows
if '%choice%'=='4' exit

echo "%choice%" is not valid, try again
echo.
goto :start

:createserver
cls
set /p name=What should the server be called?: 
set /p ram=How much ram can the server use(Gigabytes)?: 
mkdir %name%
cd %name%
echo java -Xmx%RAM%g -Xms1g -jar paper.jar > start.bat
echo eula=true > eula.txt
curl https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/384/downloads/paper-1.18.2-384.jar --output paper.jar
cls
echo Done
goto start



:openwindows
start https://classroom.google.com/c/NDY1NjI1Mzk3ODAy
start https://mail.google.com/mail/u/0/
start https://drive.google.com/drive/my-drive
cls
echo Windows opened!
goto start


