@echo off
set dialog="about:<input type=folder id=FOLDER><script>FOLDER.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FOLDER.Folder.Path);
set dialog=%dialog%close();resizeTo(0,0);</script>"

for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "folder=%%p"
echo selected folder is : "%folder%"
pause