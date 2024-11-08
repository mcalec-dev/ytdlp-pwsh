@echo OFF
 
cd "E:\yt-dlp\"

title Enter File Format
 
set /p format=Default (d) or Lossless (l)?: 
 
cls

if %format%==l start lossless.bat

if %format%==l exit

if %format%==d goto xy

:xy

title Enter URL to Download
 
set /p URL=URL: 
 
cls

yt-dlp.exe --config-location "%cd%\config\audio\default.conf" -o "%%(title)s.%%(ext)s" -w %URL%

pause

cls

title Download more?
 
set /p more=Do you want to download more? Yes (y) or No (n): 
 
if %more%==y start audio.bat
 
if %more%==y exit
 
if %more%==n goto b

:b

cls

exit