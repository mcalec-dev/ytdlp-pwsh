@echo OFF
 
cd "E:\yt-dlp\"

title Enter URL to Download
 
set /p URL=URL: 

cls

title Enter File Format
 
set /p format=.wav or .flac?: 
 
cls

if %format%==wav yt-dlp.exe --config-location "%cd%\config\audio\wav.conf" -o "%%(title)s.%%(ext)s" -w %URL%

if %format%==flac yt-dlp.exe --config-location "%cd%\config\audio\flac.conf" -o "%%(title)s.%%(ext)s" -w %URL%

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