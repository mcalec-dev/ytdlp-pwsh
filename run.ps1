Import-Module .\modules\vars.ps1
Import-Module .\modules\create.ps1
Import-Module .\modules\funcs.ps1
Import-Module .\modules\menus.ps1
Import-Module .\modules\other.ps1

# Download Video Script
function DownloadVideo {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Enter a URL"
  $URL = Read-Host -Prompt 'Enter a URL'
  if ($URL.Length -eq 0) {
    Clear-Host
    Write-Host 'Your input is blank' -ForegroundColor $red
    Pause
    RunMenu
  } else {
    $host.UI.RawUI.WindowTitle = "Downloading..."
    Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "$vidargs -w $URL" -RedirectStandardOutput ".\logs\download\video\$($date).log" -WindowStyle Minimized
    #Pause
  }
  do {
    ShowEndMenu
    $key = [System.Console]::ReadKey($true).Key
  
    switch ($key) {
      "Y" { Invoke-Item '.\downloads\video\';Clear-Host;RunMenu }
      "N" { Clear-Host;RunMenu }
      default { Write-Output "Invaild Option" }
    }
  
    if ($key -ne $endkeyargs) {
      Clear-Host
      Write-Host "Invaild Key!"
      Write-Host "Press any key to return..."
      [System.Console]::ReadKey($true) | Out-Null
    }
  } while ($key -ne $endkeyargs)
}

# Download Audio Script
function DownloadAudio {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Enter a URL"
  $URL = Read-Host -Prompt 'Enter a URL' 
  if ($URL.Length -eq 0) {
    Clear-Host
    Write-Host 'Your input is blank' -ForegroundColor $red
    Pause
    RunMenu
  } else {
    $host.UI.RawUI.WindowTitle = "Downloading..."
    Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "$audargs -w $URL" -RedirectStandardOutput ".\logs\download\audio\$($date).log" -WindowStyle Minimized
    #Pause
  }
  do {
    ShowEndMenu
    $key = [System.Console]::ReadKey($true).Key
  
    switch ($key) {
      "Y" { Invoke-Item '.\downloads\audio\';Clear-Host;RunMenu }
      "N" { Clear-Host;RunMenu }
      default { Write-Output "Invaild Option" }
    }
  
    if ($key -ne $endkeyargs) {
      Clear-Host
      Write-Host "Invaild Key!"
      Write-Host "Press any key to return..."
      [System.Console]::ReadKey($true) | Out-Null
    }
  } while ($key -ne $endkeyargs)
}

function UpdateYtdlp {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Updating..."
  Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "--update" -RedirectStandardOutput ".\logs\update\$($date).log" -WindowStyle Minimized
  Pause
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Updated"
  Write-Host "YT-DLP is now updated" -ForegroundColor $green
  Pause
  RunMenu
}

function ClearCacheAndLogs {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Clearing Cache..."
  Get-ChildItem '.\.cache' -Include * -Recurse | Remove-Item
  Get-ChildItem '.\logs' -Include * -Recurse | Remove-Item
  Pause
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Cleared Cache"
  Write-Host "Finished clearing cache and log files/folders" -ForegroundColor $green
  Pause
  RunMenu
}

# Help Dialog Script
function HelpDialog {
  Write-Host 'Use "CTRL+C" to cancel' -ForegroundColor $white
  $host.UI.RawUI.WindowTitle = "Writing help file..."
  Write-Host "Writing help file.`nPlease wait..." -ForegroundColor $yellow
  Start-Process -Wait -FilePath "$ytdlp" -ArgumentList "--help" -RedirectStandardOutput ".\.cache\help.txt" -WindowStyle Minimized

  do {
    ShowEndHelpMenu
    $key = [System.Console]::ReadKey($true).Key
  
    switch ($key) {
      "Y" { Invoke-Item '.\.cache\help.txt';Clear-Host;RunMenu }
      "N" { Clear-Host;RunMenu }
      default { Write-Output "Invaild Option" }
    }
  
    if ($key -ne $endkeyargs) {
      Clear-Host
      Write-Host "Invaild Key!"
      Write-Host "Press any key to return..."
      [System.Console]::ReadKey($true) | Out-Null
    }
  } while ($key -ne $endkeyargs)
}

# Exit PowerShell
function ExitYTDLP {
  Clear-Host
  Remove-Item -Path '.\session.lock' -Recurse -Force
  Clear-Host
  Write-Output "Closing..."
  Exit-PSHostProcess
  Exit-PSSession
  exit
  break
}

# Main Menu runtime
function RunMenu {
  do {
    #Pause
    ShowMenu
    $key = [System.Console]::ReadKey($true).Key
    switch ($key) {
      "D1" { Clear-Host;DownloadVideo }
      "D2" { Clear-Host;DownloadAudio }
      "D3" { Clear-Host;UpdateYtdlp }
      "D4" { Clear-Host;Test-Path -IsValid '.\depenencies';Test-Path -IsValid '.\config';RunMenu }
      "D8" { Clear-Host;ClearCacheAndLogs }
      "Oem4" { Clear-Host;HelpDialog }
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
