#$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(140, 120)
$ErrorActionPreference = "SilentlyContinue"
$arch = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString($_)
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ytdlp = '.\yt-dlp.exe'

$gitdluri = 'https://git.mcalec.dev/ytdlp-pwsh'
$ytdlpuri64 = 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe'
$ytdlpuri86 = 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe'
$ffmpegurilgpl = 'https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-lgpl.zip'
$ffmpegurigpl = 'https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip'

$vidargs = '--config-location ".\config\yt-dlp_v.conf" -o "%(title)s.%(ext)s"'
$audargs = '--config-location ".\config\audio\default.conf" -o "%(title)s.%(ext)s"'
$keyargs = '"D1" -or "D2" -or "D3" -or "D4" -or "D8" -or "Oem4" -or "Q"'
$endkeyargs = '"Y" -or "y" -or "N" -or "n"'

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
