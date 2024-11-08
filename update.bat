@echo off

cd "E:\yt-dlp"

set LOGFILE=logs\update.log

call :LOG > %LOGFILE%

:LOG

yt-dlp.exe --update

exit
