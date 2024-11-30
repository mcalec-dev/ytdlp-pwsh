#download finsh menu
function ShowEndMenu {
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Finished Downloading"
  Write-Host 'Finished downloading' -ForegroundColor $green
  Write-Host 'See the downloaded file? [Y]es or [N]o'
}

#help write finish menu
function ShowEndHelpMenu {
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Finished writing help file"
  Write-Host "Finished writing help file."
  Write-Host "See full documentation at  https://github.com/yt-dlp/yt-dlp#readme"
  Write-Host "Still need help? Visit the repository: https://github.com/mcalec-dev/ytdlp-pwsh"
  Write-Host "CTRL+F is your friend :3" -ForegroundColor $cyan
  Write-Host 'See the help file? [Y]es or [N]o'
}

#main menu
function ShowMenu {
  Clear-Host
  $host.UI.RawUI.WindowTitle = "Main Menu - yt-dlp"
  Write-Host '===================================' 
  Write-Host '              yt-dlp               ' -ForegroundColor $red
  Write-Host '        PowerShell Script          '
  Write-Host ''
  Write-Host '             By McAlec             ' -ForegroundColor $blue
  Write-Host '==================================='
  Write-Host ''
  Write-Host ' [1] Download Video' -ForegroundColor $darkgreen
  Write-Host ' [2] Download Audio' -ForegroundColor $darkgreen
  Write-Host ' [3] Update' -ForegroundColor $white
  Write-Host ' [4] Test Paths' -ForegroundColor $white
  Write-host ' [8] Clear Cache & Logs' -ForegroundColor $white
  Write-Host ' [?] Help' -ForegroundColor $cyan
  Write-Host ' [Q] Exit' -ForegroundColor $red
  Write-Host "`nyt-dlp $(Format-Hyperlink -Uri 'https://github.com/yt-dlp/yt-dlp' -Label 'master@f919729')"
  Write-Host ''
}
