@echo OFF
 
cd "E:\yt-dlp\"
 
title Enter File Format
 
set /p format=Audio (a) or Video (v)?: 

cls
 
if %format%==a start audio.bat

if %format%==a exit

if %format%==v goto xy

:xy

title Enter URL to Download
 
set /p URL=URL: 
 
cls
 
yt-dlp.exe --config-location "%cd%\config\yt-dlp_v.conf" -o "%%(title)s.%%(ext)s" -w %URL% & :: Audio
 
::if %format%==a @echo Audio - %URL%>>"%cd%\logs\%logfilestuff%.log"
::if %format%==v @echo Video - %URL%>>"%cd%\logs\%logfilestuff%.log"

pause

cls

title Download more?
 
set /p more=Do you want to download more? Yes (y) or No (n): 
 
if %more%==y start yt-dlp.bat
 
if %more%==y exit
 
if %more%==n goto b

:b

cls

exit