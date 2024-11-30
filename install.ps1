$gitdluri = 'https://git.mcalec.dev/ytdlp-pwsh'
$arch = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString($_)
$ytdlpuri64 = 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe'
$ytdlpuri86 = 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe'
$ffmpegurilgpl = 'https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-lgpl.zip'
$ffmpegurigpl = 'https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip'
function InstallModules {
  Clear-Host
  New-Item -Path '.\modules' -ItemType "directory" -ErrorAction SilentlyContinue
  Clear-Host
  Invoke-WebRequest $gitdluri/run.ps1 -ContentType "text/plain" -OutFile '.\run.ps1' 
  Invoke-WebRequest $gitdluri/modules/vars.ps1 -ContentType "text/plain" -OutFile '.\modules\vars.ps1' 
  Invoke-WebRequest $gitdluri/modules/create.ps1 -ContentType "text/plain" -OutFile '.\modules\create.ps1' 
  Invoke-WebRequest $gitdluri/modules/funcs.ps1 -ContentType "text/plain" -OutFile '.\modules\funcs.ps1' 
  Invoke-WebRequest $gitdluri/modules/menus.ps1 -ContentType "text/plain" -OutFile '.\modules\menus.ps1'
  Invoke-WebRequest $gitdluri/modules/other.ps1 -ContentType "text/plain" -OutFile '.\modules\other.ps1'
  Clear-Host
  Start-Sleep -Seconds 1
  InstallYtdlp
}

function InstallConfig {
  Clear-Host
  New-Item -Path '.\config' -ItemType "directory" -ErrorAction SilentlyContinue
  New-Item -Path '.\config\video' -ItemType "directory" -ErrorAction SilentlyContinue
  New-Item -Path '.\config\audio' -ItemType "directory" -ErrorAction SilentlyContinue
  Clear-Host
  Invoke-WebRequest $gitdluri/config/yt-dlp_v.conf -ContentType "text/plain" -OutFile '.\config\video\yt-dlp_v.conf'

  Invoke-WebRequest $gitdluri/config/audio/default.conf -ContentType "text/plain" -OutFile '.\config\audio\default.conf'
  Invoke-WebRequest $gitdluri/config/audio/mp3.conf -ContentType "text/plain" -OutFile '.\config\audio\mp3.conf'
  Invoke-WebRequest $gitdluri/config/audio/wav.conf -ContentType "text/plain" -OutFile '.\config\audio\wav.conf' 
  Invoke-WebRequest $gitdluri/config/audio/opus.conf -ContentType "text/plain" -OutFile '.\config\audio\opus.conf' 
  Invoke-WebRequest $gitdluri/config/audio/ogg.conf -ContentType "text/plain" -OutFile '.\config\audio\ogg.conf' 
  Invoke-WebRequest $gitdluri/config/audio/m4a.conf -ContentType "text/plain" -OutFile '.\config\audio\m4a.conf' 
  Invoke-WebRequest $gitdluri/config/audio/flac.conf -ContentType "text/plain" -OutFile '.\config\audio\flac.conf' 
  Invoke-WebRequest $gitdluri/config/audio/alac.conf -ContentType "text/plain" -OutFile '.\config\audio\alac.conf' 
  Invoke-WebRequest $gitdluri/config/audio/aac.conf -ContentType "text/plain" -OutFile '.\config\audio\aac.conf' 
  Clear-Host
  Start-Sleep -Seconds 1
  InstallYtdlp
}

function InstallYtdlp {
  Clear-Host
  #Import-Module .\modules\vars.ps1
  New-Item -Path '.\.cache\install' -ItemType "directory"
  Clear-Host
  if ($arch -eq 'X64') {
    Invoke-RestMethod $ytdlpuri64 -OutFile '.\.cache\install\yt-dlp_x64.exe'
    Move-Item -Path '.\.cache\install\yt-dlp_x64.exe' -Destination '.\yt-dlp.exe'
  } 
  elseif ($arch -eq 'X86') {
    Invoke-RestMethod $ytdlpuri86 -OutFile '.\.cache\install\yt-dlp_x86.exe'
    Move-Item -Path '.\.cache\install\yt-dlp_x86.exe' -Destination '.\yt-dlp.exe'
  }
  Clear-Host
  Get-ChildItem -Path '.\.cache\install' -Include * -Recurse -Force | Remove-Item -Recurse -Force
  Clear-Host
  Start-Sleep -Seconds 1
  InstallDepenencies
}

function InstallDepenencies {
  Clear-Host
  #Import-Module .\modules\vars.ps1
  New-Item -Path '.\depenencies' -ItemType "directory"
  Clear-Host
  if ($arch -eq 'X64') {
    Invoke-WebRequest $ffmpegurigpl -ContentType 'application/zip-compressed' -OutFile '.\.cache\install\ffmpeg_gpl.zip'
    Expand-Archive -Path '.\.cache\install\ffmpeg_gpl.zip' -DestinationPath '.\.cache\install'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe' -Destination '.\depenencies\ffmpeg.exe'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-gpl\bin\ffplay.exe' -Destination '.\depenencies\ffplay.exe'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe' -Destination '.\depenencies\ffprobe.exe'
  }
  elseif ($arch -eq 'X86') {
    Invoke-WebRequest $ffmpegurilgpl -ContentType 'application/zip-compressed' -OutFile '.\.cache\install\ffmpeg_lgpl.zip'
    Expand-Archive -Path '.\.cache\install\ffmpeg_lgpl.zip' -DestinationPath '.\.cache\install'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-lgpl\bin\ffmpeg.exe' -Destination '.\depenencies\ffmpeg.exe'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-lgpl\bin\ffplay.exe' -Destination '.\depenencies\ffplay.exe'
    Move-Item -Path '.\.cache\install\ffmpeg-master-latest-win64-lgpl\bin\ffprobe.exe' -Destination '.\depenencies\ffprobe.exe'
  }
  Clear-Host
  Get-ChildItem -Path '.\.cache\install' -Include * -Recurse -Force | Remove-Item -Recurse -Force
  Clear-Host
  Start-Sleep -Seconds 1
  CleanUpInstallation
}

function CleanUpInstallation {
  Clear-Host
  Remove-Item -Path '.\.cache\install' -Force
  Remove-Item -Path '.\.cache' -Force
  Clear-Host
  Start-Sleep -Seconds 1
  ExitInstall
}

function ExitInstall {
  Write-Output "We're done!"
  Start-Sleep -Seconds 1
  Start-Process .\run.ps1
  Exit-PSHostProcess
  Exit-PSSession
  exit
  break
}

InstallModules
