$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ytdlp = ".\yt-dlp.exe"

Start-Process -FilePath "$ytdlp" -ArgumentList "--version" -RedirectStandardOutput ".\logs\version_$($date).log"
