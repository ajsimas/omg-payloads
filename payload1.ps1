# Change the console title
$Host.UI.RawUI.WindowTitle = "System Diagnostics"

# Display a harmless visual animation
$width = 30
$direction = 1
$position = 0

for ($i = 0; $i -lt 50; $i++) {
  $line = " " * $position + "o"
  Clear-Host
  Write-Host $line
  Start-Sleep -Milliseconds 100
  $position += $direction
  if ($position -eq $width - 1 -or $position -eq 0) {
    $direction = - $direction
  }
}
