New-Item -Path '.\logs\download\video' -ItemType Directory
New-Item -Path '.\logs\download\audio' -ItemType Directory
New-Item -Path '.\logs\download\subtitle' -ItemType Directory
New-Item -Path '.\downloads\video' -ItemType Directory
New-Item -Path '.\downloads\audio' -ItemType Directory
New-Item -Path '.\downloads\subtitle' -ItemType Directory
New-Item -Path '.\.cache' -ItemType Directory
New-Item -Path '.\session.lock' -Force -ItemType File
' ' | Out-File -FilePath '.\session.lock' -Force -NoNewline