# Define output file path
$outputFile = [System.IO.Path]::Combine($env:USERPROFILE, "Documents", "SystemInfo.txt")

# Collect system information
$info = @{
  ComputerName = $env:COMPUTERNAME
  UserName     = $env:USERNAME
  OS           = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
  Architecture = (Get-CimInstance -ClassName Win32_Processor).AddressWidth
  LastBootTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
  IPAddress    = (Get-NetIPAddress -AddressFamily IPv4 | Select-Object -First 1).IPAddress
}

# Write the information to a file
$info | Out-File -FilePath $outputFile -Encoding UTF8

# Optionally, log completion
Write-Host "System information saved to $outputFile"
