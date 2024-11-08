#$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(120, 10)
$ytdlp = '.\yt-dlp.exe'
# Arguments for executable or custom ones
$vidargs = '--config-location ".\config\yt-dlp_v.conf" -o "%(title)s.%(ext)s" '
$audargs = '--config-location ".\config\audio\default.conf" -o "%(title)s.%(ext)s" '
$keyargs = '"D1" -or "D2" -or "D3" -or "D4" -or "Oem4" -or "q"'
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
# Color Varibles
$cyan = 'cyan'
$white = 'white'
$red = 'red'
$green = 'green'
$red = 'red'
$gray = 'gray'

# Download Video Script
function DownloadVideo {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Enter a URL"
  $URL = Read-Host -Prompt 'Enter a URL'
  $host.UI.RawUI.WindowTitle = "Downloading..."
  Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "$vidargs-w $URL" -RedirectStandardOutput ".\logs\download_$($date).log" -WindowStyle Minimized
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Finished Downloading"
  Write-Host 'Finished downloading' -ForegroundColor $green -BackgroundColor White
  $ans = Read-Host -Prompt 'See the downloaded file? [Y]es or [N]o'
  if ($ans -eq "y" -or "Y") {
    Invoke-Item '.\downloads\video\'
  } elseif ($ans -eq "n" -or "N") {
    pause
  }
  RunMenu
}

# Download Audio Script
function DownloadAudio {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Enter a URL"
  $URL = Read-Host -Prompt 'Enter a URL'
  $host.UI.RawUI.WindowTitle = "Downloading..."
  Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "$audargs-w $URL" -RedirectStandardOutput ".\logs\download_$($date).log" -WindowStyle Minimized
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Finished Downloading"
  Write-Host 'Finished downloading' -ForegroundColor $green -BackgroundColor White
  $ans = Read-Host -Prompt 'See the downloaded file? [Y]es or [N]o'
  if ($ans -eq "y" -or "Y") {
    Invoke-Item '.\downloads\audio\'
  } elseif ($ans -eq "n" -or "N") {
    pause
  }
  RunMenu
}

# Help Dialog Script
function HelpDialog {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Writing help file..."
  Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "--help" -RedirectStandardOutput ".\.cache\help.txt" -WindowStyle Minimized
  $host.UI.RawUI.WindowTitle = "Finished writing help file"
  Write-Host "Successfully wrote help.txt"
  Write-Host "See full documentation at  https://github.com/yt-dlp/yt-dlp#readme"
  Write-Host "CTRL+SHIFT+F is your friend :3" -ForegroundColor $green
  Write-Host "Still need help? Visit the repository: https://github.com/mcalec-dev/ytdlp-pwsh"
  $seehelpfile = Read-Host -Prompt 'See the help file? [Y]es or [N]o'
  if ($seehelpfile -eq "y" -or "Y") {
    Invoke-Item ".\.cache\help.txt"
    Pause
  } else { RunMenu }
  RunMenu
}

# Exit PowerShell
function ExitYTDLP {
  Write-Output "Closing..."
  Exit-PSHostProcess
  Exit-PSSession
  exit
  break
}

# Center command 'Write-HostCenter'
function Write-HostCenter { param($Message) Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message) }

# Main Menu text
function ShowMenu {
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Main Menu - yt-dlp"
  Write-Host '===================================' 
  Write-Host '              yt-dlp               ' -ForegroundColor $red
  Write-Host '        PowerShell Script          '
  Write-Host ''
  Write-Host '             By McAlec             ' -ForegroundColor DarkBlue
  Write-Host '==================================='
  Write-Host ''
  Write-Host ' [1] Download Video' -ForegroundColor $green
  Write-Host ' [2] Download Audio' -ForegroundColor $green
  Write-Host ' [3] Update' -ForegroundColor $white
  Write-Host ' [?] Help' -ForegroundColor $cyan
  Write-Host ' [Q] Exit' -ForegroundColor $red
  Write-Host ''
}

# Main Menu runtime
function RunMenu {
do {
  ShowMenu
  $key = [System.Console]::ReadKey($true).Key

  switch ($key) {
    "D1" { Clear-Host;DownloadVideo }
    "D2" { Clear-Host;DownloadAudio }
    "D3" { Clear-Host;Write-Output "Updating...";Start-Process -Wait -FilePath ".\update.ps1";Write-Output "Done!";RunMenu }
    "Oem2" { Clear-Host;HelpDialog }
    "Q" { Clear-Host;ExitYTDLP }
    default { Write-Output "Invaild Option" }
  }

  if ($key -ne $keyargs) {
    Clear-Host
    Write-Host "Invaild Key!"
    Write-Host "Press any key to return..."
    [System.Console]::ReadKey($true) | Out-Null
  }
} while ($key -ne $keyargs)
}
RunMenu
