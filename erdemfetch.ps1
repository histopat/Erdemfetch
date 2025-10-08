# erdemfetch.ps1 (c) 2025 Erdem.
Write-Output "==============="
Write-Output "  Erdemfetch   "
Write-Output "==============="
Write-Output ("User         :  {0}" -f $env:USERNAME)
Write-Output ("Machine      :  {0}" -f $env:COMPUTERNAME)
Write-Output ("OS           :  {0}" -f (Get-CimInstance Win32_OperatingSystem | ForEach-Object { "$($_.Caption) $($_.Version)" }))
Write-Output ("Architecture :  {0}" -f $env:PROCESSOR_ARCHITECTURE)

# Disk info (C:)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$used = [math]::Round(($disk.Size - $disk.FreeSpace)/1GB,2)
$total = [math]::Round($disk.Size/1GB,2)
Write-Output ("Disk (C:)    :  {0}GB/{1}GB used" -f $used, $total)

# Process count
$procCount = (Get-Process | Measure-Object).Count
Write-Output ("Processes    :  {0}" -f $procCount)

Write-Output "==============="