$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ytdlp = ".\yt-dlp.exe"

Start-Process -FilePath "$ytdlp" -ArgumentList "--update" -RedirectStandardOutput ".\logs\update_$($date).log"
