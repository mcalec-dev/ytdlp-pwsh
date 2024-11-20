#$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(140, 120)
$ErrorActionPreference = "SilentlyContinue"
$is64Bit = Test-Path 'Env:ProgramFiles(x86)'
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ytdlp = '.\yt-dlp.exe'

#urls
$ytdlpurl64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.18/yt-dlp.exe'
$ytdlpurl86 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.18/yt-dlp_x86.exe'
$ytdlpurlzip = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.18/yt-dlp_win.zip'
$ffmpegurl64 = 'https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip'
$ffmpegurl86 = ''
$ffmpegurlzip = ''

#args
$vidargs = '--config-location ".\config\yt-dlp_v.conf" -o "%(title)s.%(ext)s"'
$audargs = '--config-location ".\config\audio\default.conf" -o "%(title)s.%(ext)s"'
$keyargs = '"D1" -or "D2" -or "D3" -or "D4" -or "D8" -or "D0" -or "Oem4" -or "q"'
$endkeyargs = '"Y" -or "y" -or "N" -or "n"'

#colors
$black = "Black"
$gray = "Gray"
$white = "White"

$red = "Red"
$yellow = "Yellow"
$green = "Breen"
$cyan = "Cyan"
$blue = "Blue"
$magenta = "Magenta"

$darkred = "DarkRed"
$darkyellow = "DarkYellow"
$darkgreen = "DarkGreen"
$darkcyan = "DarkCyan"
$darkblue = "DarkBlue"
$darkmagenta = "DarkMagenta"
