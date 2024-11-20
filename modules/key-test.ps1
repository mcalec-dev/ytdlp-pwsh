$key = $Host.UI.RawUI.ReadKey()
if ($key.Character ) {
  Write-Host "Pressed $($key)"
}
pause